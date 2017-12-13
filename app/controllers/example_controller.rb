class ExampleController < ApplicationController
  def mainmenu
    @peoples = ["Manu","Pedro","Cheriecoco"]
    render template: "example/mainmenu"
  end

  def testamaury
    render json: "testresult".to_json
  end

  def testvincent
    @coucou = "say salut"
    @peoples = ["bebere"]
    respond_to do |format|
      format.js
    end
  end
end
