class HomeController < ApplicationController
  def mainmenu
    @peoples = ["Manu","Pedro","Cheriecoco"]
    render template: "home/mainmenu"
  end

  def test
    render json: "testresult".to_json
  end
end
