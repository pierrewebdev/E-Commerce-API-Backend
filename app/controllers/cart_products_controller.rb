class CartProductsController < ApplicationController
    before_action :authorized, only: [:create]
    def create
        #will be receiving token in fetch request
        #use the of the current cart and the product id passed in by the post request
        current_cart = @customer.carts.find_by(checked_out:false)
        product = Product.find(params[:productId])

        new_cart_product = CartProduct.create(cart:current_cart,product:product)
        render json: new_cart_product
    end
end
