Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users
  resources :listings
  resources :users
  post "/orders/add_listing/:listing_id", to: 'orders#add_listing', as: 'order_add_listing'
  get "/orders/add_listing/:listing_id" => "orders#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'listings#index'
end
