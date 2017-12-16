Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/profile' => "home#profile"
  #example 1 snippet
  get '/example/testamaury' => "example#testamaury"
  get '/example/testvincent/:array' => "example#testvincent"
  get '/example' => "example#mainmenu"

  #example 2 snippet
  get '/example2/initMTable' => "example2#initMTable"
  get '/example2/addData/:addValue/:mTableArrayExample2MainMenu' => "example2#addValue"
  get '/example2/removeData/:id/:mTableArrayExample2MainMenu' => "example2#removeData"
  get '/example2' => "example2#mainmenu"

  #example leaflet
  get '/leafletview/addMarker' => "mapview#addMarker"
  get '/leafletview' => "mapview#mainview"

  #hackathon real routes
  get '/home' => "home#realhome"
  get '/map' => "home#mainpage"
  get '/home/fetchflat' => "home#fetchflat"

  get '/hackathonmock' => "fetcher#hackathonmock"
  get '/gather/:lat/:lng' => "fetcher#specificflat"
  get '/fetcharea' => "fetcher#area"



  get '/' => redirect("/home")
  get "*path" => redirect("/home")
end
