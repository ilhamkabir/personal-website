Rails.application.routes.draw do
  root 'home#index'
  get 'home/about'
  resources :blogs
  resources :users
  resource :sessions, only: [:create, :destroy]
  get 'auth/auth-/callback' => 'sessions#create'
end
