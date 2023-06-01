Rails.application.routes.draw do
  devise_for :users
  get 'item/index'
  root to: "items#index"
end
