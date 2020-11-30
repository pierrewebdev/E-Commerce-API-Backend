class CartProductsController < ApplicationController
    # before_action :authorized, only: [:create,:delete]
    def create
       #will be receiving token in fetch request
        #use the of the current cart and the product id passed in by the post request
        current_cart = @customer.carts.find_by(checked_out:false)
        product = Product.find(params[:productId])

        new_cart_product = CartProduct.create(cart:current_cart,product:product, quantity:1)
        render json: new_cart_product
    end

    def increase_quantity
        cart_product_to_update = cart_product_to_update = CartProduct.find_by(product:params[:productId],cart:params[:cartId])

        cart_product_to_update.update(quantity:cart_product_to_update.quantity + 1) 

        render json: cart_product_to_update
    end

    def decrease_quantity
        cart_product_to_update = cart_product_to_update = CartProduct.find_by(product:params[:productId],cart:params[:cartId])

        cart_product_to_update.update(quantity:cart_product_to_update.quantity - 1) 

        render json: cart_product_to_update
    end

    def delete
        #need the product id and the cart id
        product_to_delete = CartProduct.find_by(cart_id:params[:cartId],product_id:params[:productId])
        product_to_delete.destroy

        render json:product_to_delete
    end
end
