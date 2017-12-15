class HomeController < ApplicationController
  def mainpage
    render template: "home/mainmenu"
  end

  def fetchflat
    respond_to do |format|
      format.js
    end
  end
end
