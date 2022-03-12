Rails.application.routes.draw do
  root 'home#index'
  get 'home/about'
  resources :blogs
  resources :users
end
