Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #route to make sure app has been deployed to heroku properly
  get "/", to: "system#heroku_check"
  #routes for customer controller
  post "/login", to: "customers#login"
  post "/register", to: "customers#register"
  get "/keep-logged-in", to: "customers#keep_logged_in"
  get "/customer/:id", to: "customers#show"

  #routes for products controller
  get "/products", to: "products#index"

  #routes for carts controller
  get "/carts", to: "carts#index"
  post "/check-out", to: "carts#check_current_cart_out"

  #routes for cart_products controller
  post "/cart_products", to: "cart_products#create"
  patch "/increment-quantity", to: "cart_products#increase_quantity"
  patch "/decrement-quantity", to: "cart_products#decrease_quantity"
  delete "delete-from-cart", to: "cart_products#delete"


  #route to create new charges in stripe api
  post "/create-charge", to: "charges#create"

  #routes for reviews controller
  post "/reviews", to: "reviews#create"
end
