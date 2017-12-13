class ExampleController < ApplicationController
  def mainmenu
    @peoples = ["Manu","Pedro","Cheriecoco"]
    render template: "example/mainmenu"
  end

  def testamaury
    render json: "testresult".to_json
  end

  def testvincent
    @arrayJson = JSON.parse params["array"]
    @arrayJson.push("bebere")
    @arrayJson = URI.encode @arrayJson.to_json
    respond_to do |format|
      format.js
    end
  end
end
