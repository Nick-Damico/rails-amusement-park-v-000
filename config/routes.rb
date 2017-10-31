Rails.application.routes.draw do

# Static Controller Routes
get '/home' => 'static#home'

# Users Controller Routes
root 'users#new'
get '/users/new' => 'users#new'
get '/users/:id', to: "users#show", :as => "user_path"
post '/users' => 'users#create'
end