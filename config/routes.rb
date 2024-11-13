Rails.application.routes.draw do
  get "articles/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "users#signin_form"
  post "signin", to: "users#signin", as: "signin"

  resources :users

  # Routes
  # Root Route(mainly for setting home page/starting page for user when opens app)
  # get "/articles", to: "articles#index"
  # to show single article based on id
  # get "/articles/:id", to: "articles#show"
  resources :articles do
    resources :comments
  end
end
