Rails.application.routes.draw do
resources :attractions
resources :users
# Static Controller Routes
get '/home' => 'static#home'

# Users Controller Routes
root 'users#new'
get '/users/new' => 'users#new'
# get '/users/:id' => "users#show"
# post '/users' => 'users#create'
delete '/signout' => 'users#destroy'

# Sessions Controller Login
get '/signin' => 'sessions#new'
post '/signin' => 'sessions#create'
end