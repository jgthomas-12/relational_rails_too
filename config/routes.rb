Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/areas", to: "areas#index"
  get "/climbs", to: "climbs#index"
  get "/areas/new", to: "areas#new"
  post "/areas", to: "areas#create"
  get "/areas/:id", to: "areas#show"
  get "/climbs/:id", to: "climbs#show"
  get "/areas/:id/climbs", to: "areas/climbs#index"

  get "/areas/:id/edit", to: "areas#edit"
  patch "/areas/:id", to: "areas#update"
end
