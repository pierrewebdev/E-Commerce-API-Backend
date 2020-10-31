class CustomersController < ApplicationController
    def login
        email = permit_login[:email]
        password = permit_login[:password]

        customer = Customer.find_by(email:email)
        if customer && customer.authenticate(password)
            customer_token = encode_token(customer)
            render json: {customer_info:CustomerSerializer.new(customer),token:customer_token}
        else
            render json: {error:"Sorry, incorrect email or password"}
        end
    end


  private
  
  def permit_login
    params.permit(:email,:password)
  end
end
