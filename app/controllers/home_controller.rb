class HomeController < ApplicationController
  def mainpage
    render template: "home/mainmenu"
  end
end
