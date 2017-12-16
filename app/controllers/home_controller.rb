class HomeController < ApplicationController
  def mainpage
    render template: "home/mainmenu"
  end

  def realhome
    render template: "home/realhome"
  end

  def fetchflat
    respond_to do |format|
      format.js
    end
  end

  def profile
    render template: "home/profile"
  end
end
