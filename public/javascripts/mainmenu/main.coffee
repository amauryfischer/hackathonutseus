
@paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  alert "coucou"
  if textColor?
    element.style.color = textColor
