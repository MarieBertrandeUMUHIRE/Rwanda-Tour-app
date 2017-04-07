Rails.application.routes.draw do
  get "/", to: 'pages#index'
  get "/pages", to: 'pages#emergency'
  get "/pages/:id", to: 'pages#show'
  get "/weathers", to: 'weathers#index'
  get "/destinations", to:'destinations#index'
  get "/destinations/new", to: 'destinations#new'
  get "/destinations/:id", to:'destinations#show'
  post "/destinations", to: 'destinations#create'
  get "/destinations/:id/edit", to:'destinations#edit'
  patch "/destinations/:id", to:'destinations#update'
  delete "/destinations/:id", to: 'destinations#destroy'
  get "/signup" => "users#new"
  post "/destinations/search", to: 'destinations#search'
  # post "/pages/search", to: 'pages#search'
  post "/users" => "users#create"
  get "/users/:id/edit", to: 'users#edit'
  patch "users/:id", to: 'users#update'
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
  get "/orders", to:'orders#new'
  get "images", to: 'images#index'

  get "/images/new", to:'images#new'
  post "/images", to:'images#create'
  get "/images/:id/edit", to: 'images#edit'
  patch "images/:id", to: 'images#update'
  delete "destinations/images/:id", to: 'images#destroy'

end
