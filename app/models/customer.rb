class Customer < ApplicationRecord
    has_secure_password

    has_many :carts

    def current_cart
        cart = self.carts.find_or_create_by(checked_out:false)
        CartSerializer.new(cart)
    end

    def past_carts
        carts = self.carts.where(checked_out:true)
        carts.map{|cart| CartSerializer.new(cart)}
    end
end
