# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


@paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor

@myAlert = () ->
  alert "sayBouh"

@renderTab = () ->
  $("#output").html("") #clean html
  JSON.parse(localStorage.getItem("arrayJson")).forEach (element, i)  =>
      $("#output").append('<a class="collection-item">' + element + '</a>')


arrayJson = ["amaury","vincent","matthieu"]
localStorage.setItem("arrayJson",JSON.stringify(arrayJson))
$ ->
  renderTab()

  $("a[data-background-color]").click (e) ->
    e.preventDefault()

    backgroundColor = $(this).data("background-color")
    textColor = $(this).data("text-color")
    this.style.backgroundColor = backgroundColor
    if textColor?
      this.style.color = textcolor
    #paintIt(this, backgroundColor, textColor)

  $("#amaurysend").click (e) ->
    e.preventDefault()
    $.ajax(url: "/example/testamaury").done (html) ->
      $("#results").append html

  $("#vincentsend").click (e) ->
    e.preventDefault()
    $.ajax("/example/testvincent/"+localStorage.getItem("arrayJson")).done (js) ->
      #eval(js) the code is already evaled
