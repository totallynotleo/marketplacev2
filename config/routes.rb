Rails.application.routes.draw do
  resources :line_items
  resources :carts
  devise_for :users
  resources :listings
  resources :users
  get 'success', to: "stripe_response#success"
  post 'add_item/:listing_id', to: 'carts#add_item', as: 'add_item'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'listings#index'
  get '/search' => 'listings#search', :as => 'search_page'
end
