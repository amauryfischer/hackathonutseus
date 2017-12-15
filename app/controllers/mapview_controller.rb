class MapviewController < ApplicationController
  def mainview
    render template: "mapview/mainview"
  end

  def addMarker
    @sayCoucou = "coucou"
    respond_to do |format|
      format.js
    end
  end
end
