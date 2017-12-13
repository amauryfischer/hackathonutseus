class HomeController < ApplicationController
  def mainmenu
    @peoples = ["Manu","Pedro","Cheriecoco"]
    render template: "home/mainmenu"
  end
end
