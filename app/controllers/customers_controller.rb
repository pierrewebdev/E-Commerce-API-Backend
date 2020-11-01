class CustomersController < ApplicationController
    before_action :authorized, only: [:keep_logged_in]

    def login
        email = permit_login[:email]
        password = permit_login[:password]

        customer = Customer.find_by(email:email)
        if customer && customer.authenticate(password)
            customer_token = encode_token({customer_id:customer[:id]})
            render json: {customer_info:CustomerSerializer.new(customer),token:customer_token}
        else
            render json: {error:"Sorry, incorrect email or password"}
        end
    end

    def keep_logged_in
        customer_token = encode_token({customer_id:@customer})
        render json: {
            customer: CustomerSerializer.new(@customer),
            token: customer_token
        }
    end


  private
  
  def permit_login
    params.permit(:email,:password)
  end
end
