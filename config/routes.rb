Rails.application.routes.draw do
  root "home#index"

  resources :users, except: [:new]

  get "/create_users", to: "users#create_users"
  get "/search", to: "users#search"
end
