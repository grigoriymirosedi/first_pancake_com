Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: proc { [200, {}, ['']] }

  post "/registration", to: "registration#create"

  get "/receipts", to: "receipt#index"
  post "/receipt", to: "receipt#create_receipt"
  get "/receipts/favourite", to: "receipt#favourites"
  post "/receipts/favourite/:id", to: "receipt#add_favourite"
  get "/receipt/:id", to: "receipt#receipt_id"

  get "/user/subscribers", to:  "subscription#subscribers"
  get "/user/subscriptions", to: "subscription#subscriptions"
  post "/user/subscribe", to: "subscription#subscribe"

  post "/login", to: "login#login"
  get "/user", to: "login#user"
end 