class HomController < ApplicationController
  def mainpage
    render template: "home/mainmenu"
  end
end
