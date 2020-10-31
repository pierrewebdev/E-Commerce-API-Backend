Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #routes for customer controller
  post "/login", to: "customers#login"

  #routes for products controller
  get "/products", to: "products#index"
end
