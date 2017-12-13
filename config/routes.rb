Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/example/testamaury' => "example#testamaury"
  get '/example/testvincent' => "example#testvincent"
  get '/example' => "example#mainmenu"

end
