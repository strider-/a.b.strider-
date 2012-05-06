# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.NFO = window.NFO or {}

$ ->
  window.NFO.Links.init()

window.NFO.Links = 
  init: ->
    $('.plink').live 'click', ->
      $('.plink_info').hide()
      $('.plink').removeClass 'selected_link'
      $(this).addClass 'selected_link'
      $(this).next('.plink_info').show()
    $('.link_action').live 'click', @performLinkAction

  post: (url, method, data, callback) ->
    $.ajax
      type: method or 'POST',
      url: url,
      data: data,
      success: callback

  addMessage: (message) ->
    content = $('div.content').first()
    if content
      window.NFO.Flash.dismiss()
      window.NFO.Flash.addMessage message 

  performLinkAction: ->    
    self = window.NFO.Links
    $parent = $(this).parent()
    $section = $parent.parent()
    action = $(this).attr('rel')
    id = parseInt $parent.find('[name=id]').val()
    title = $parent.find('[name=title]').val()
    link = $parent.find('[name=link]').val()
    code = $parent.find('[name=code]').val()

    if action is 'save'      
      if title.trim().length is 0 or link.trim().length is 0 or code.trim().length is 0
        self.addMessage 'One or more fields were left blank!'
      else
        url = '/links/update'
        method = 'POST'
        if id is 0
          url = '/links/create'
          method = 'PUT'

        self.post url, method,
          link:
            id: id
            title: title
            link: link
            code: code
        , (data) ->
          if data.success
            self.addMessage "Changes saved to " + title + " link."
            $section.find("[name=id]").val data.id
            $section.prev().text title
            $(".footer").append "<a href='" + link + "' title='" + title + "'>[" + code + "]</a>" if id is 0
          else
            self.addMessage data.error         
    else if action is "delete"
      if id > 0
        sure = confirm("Are you sure you want to delete the " + title + " link?")
        if sure
          self.post "/links/delete", 'DELETE'
            link_id: id
          , (data) ->
            if data.success
              self.addMessage title + " link has been deleted."
              $section.closest('.plink_tab').remove();
              $("div.footer a[href='" + link + "']").remove()
            else
              self.addMessage data.error     
      else
        $section.closest('.plink_tab').remove()                  
    else if action is 'add'
      $container = $("#link_container")
      if $container.find("input[value='0']").length is 0    
        $newLink = $(HandlebarsTemplates['new_personal_link']())
        $container.append $newLink
        $container.find(".plink_tab span").last().trigger "click"
      else
        $container.find(".plink:last").click()