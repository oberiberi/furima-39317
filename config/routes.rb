Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'item/index'
  resources :items, only: [:index, :new]
end
