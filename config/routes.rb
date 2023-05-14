Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/areas", to: "areas#index"
  get "/climbs", to: "climbs#index"
  get "/areas/:id", to: "areas#show"
  get "/climbs/:id", to: "climbs#show"
  get "/areas/:area_id/climbs", to: "areas/climbs#index"
end
