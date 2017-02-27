Rails.application.routes.draw do
 get "/destinations", to:'destinations#index'
  get "/destinations/new", to: 'destinations#new'
  get "/destinations/:id", to:'destinations#show'
  post "/destinations", to: 'destinations#create'
  get "/destinations/:id/edit", to:'destinations#edit'
  patch "/destinations/:id", to:'destinations#update'
  delete "/destinations/:id", to: 'destinations#destroy'
end
