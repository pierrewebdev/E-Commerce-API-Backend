class CartsController < ApplicationController
    before_action :authorized, only: [:check_current_cart_out]
    def index
        carts = Cart.all
        render json: carts
    end

    def check_current_cart_out
        #need to swith the current cart to being checked_out
        #then create a brand new cart that has checked_out as false and associate it with @customer
        #finally need to render new cart to the front end as json

        cart_id = params[:cartId]
        Cart.find(cart_id).update(checked_out:true)

        new_cart = Cart.create(customer:@customer,checked_out:false,save_for_later:false)
        render json:new_cart
    end
end
