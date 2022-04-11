Rails.application.routes.draw do

  # authentication
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'

  root 'home#index'
  get 'home/about'
  resources :blogs
  resources :users
end
