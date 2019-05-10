Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users
  resources :listings
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'listings#index'
end
