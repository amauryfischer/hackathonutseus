class Example2Controller < ApplicationController
  def mainmenu
    render template: "example2/mainmenu"
  end

  def initMTable
    #load data from file
    file = File.open("amausave.json")
    @jsonfile = JSON.parse file.read
    file.close
    @mTableArrayExample2 = URI.encode @jsonfile.to_json
    respond_to do |format|
      format.js
    end
  end

  def addValue
    @addValue = params["addValue"]
    @mTableArrayExample2MainMenu = JSON.parse params["mTableArrayExample2MainMenu"]
    if @mTableArrayExample2MainMenu == [""]
      @mTableArrayExample2MainMenu = [@addValue]
    else
      @mTableArrayExample2MainMenu.push(@addValue)
    end
    file = File.open("amausave.json","w")
    file.write(@mTableArrayExample2MainMenu.to_json)
    file.close
    @json = URI.encode @mTableArrayExample2MainMenu.to_json

    #save data to file

    respond_to do |format|
      format.js
    end
  end

  def removeData
    @id = params["id"].to_i
    @mTableArrayExample2MainMenu = JSON.parse params["mTableArrayExample2MainMenu"]
    @mTableArrayExample2MainMenu.delete_at(@id)

    file = File.open("amausave.json","w")
    file.write(@mTableArrayExample2MainMenu.to_json)
    file.close
    @json = URI.encode @mTableArrayExample2MainMenu.to_json

    #save data to file

    respond_to do |format|
      format.js
    end
  end
end
