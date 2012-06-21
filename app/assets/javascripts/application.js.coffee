# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require handlebars.runtime
#= require_tree .
#= require_tree ../templates

window.NFO = window.NFO or {}

$ ->
  window.NFO.Flash.init()
  window.NFO.SiteFeatures.init()

window.NFO.Flash = 
  container: null
  init: ->
    this.container = $('div.content')
    $('a.close').live 'click', ->
      $(this).closest('.message').slideUp 'fast', ->
        $(this).remove()
  addMessage: (message) ->
    $result = $(HandlebarsTemplates['flash_message']({ message: message })).hide()
    this.container.prepend($result)
    $result.slideDown "fast"
  dismiss: ->
    this.container.find('.message a.close').click()


window.NFO.SiteFeatures = init: ->
  # enabling timeago plugin
  $("time.timeago").timeago()
  # enabling 'cancel' elements by id
  $("#cancel").click (e) ->
    e.preventDefault()
    window.location = '/'
    return false