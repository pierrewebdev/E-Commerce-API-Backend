class CartMailer < ApplicationMailer
    def send_order_details(customer, cart_info)
        @customer = customer
        @cart_info = cart_info.products.map{|product| {name:product.name, image: product.image}}
        mail(to: @customer.email, subject: 'Your Health and Fitness Order Details')
      end    
end
