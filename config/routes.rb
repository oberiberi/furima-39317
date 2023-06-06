Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  # get '/items'
  resources :items, only: [:index, :new, :create]
  resources :users, only: [:show]
end
