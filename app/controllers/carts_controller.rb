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

        #send email out with ruby action mailer
        CartMailer.send_order_details(@customer, Cart.find(cart_id)).deliver_now

        new_cart = Cart.create(customer:@customer,checked_out:false,save_for_later:false)
        past_carts = @customer.past_carts
        render json:{new_cart:CartSerializer.new(new_cart),past_carts:past_carts}

    end
end
