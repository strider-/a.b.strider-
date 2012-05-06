# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.NFO = window.NFO or {}

$ ->
  window.NFO.Tags.init()

window.NFO.Tags = 
  init: ->
    $("span.tag").live "click", ->
      $(this).remove()
    $("input#tag").keypress (e) ->
      if e.keyCode is 13 or e.keyCode is 44
        e.preventDefault()
        tag = $(this).val()
        if tag and tag.length > 0
          window.NFO.Tags.addTag tag
          $(this).val ""
        false
  addTag: (tag) ->
    exists = false
    $("div.tags span").each ->
      exists = true  if $(this).text().trim().toLowerCase() is tag.trim().toLowerCase()

    unless exists
      span = $(document.createElement("span")).attr(title: "click to remove").addClass("tag").text(tag).appendTo($("div.tags"))
      $(document.createElement("input")).attr(
        type: "hidden"
        value: tag
        name: "tags[]"
      ).appendTo $(span)
