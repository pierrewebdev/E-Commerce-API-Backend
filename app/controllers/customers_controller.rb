class CustomersController < ApplicationController
    before_action :authorized, only: [:keep_logged_in]

    def show
        customer = Customer.find(params[:id])
        render json: customer
    end

    def login
        email = permit_login[:email]
        password = permit_login[:password]
        customer = Customer.find_by(email:email)
        byebug
        if customer && customer.authenticate(password)
            customer_token = encode_token({customer_id:customer.id})
            byebug
            render json: {customer_info:CustomerSerializer.new(customer),token:customer_token}
        else
            render json: {error:"Sorry, incorrect email or password"}
        end
    end

    def register
        permitted_params = permit_register
        new_customer = Customer.create(
            :name => permitted_params[:name],
            :email => permitted_params[:email],
            :password => permitted_params[:password]
        )
        if new_customer.valid?
          customer_token = encode_token({customer_id:new_customer.id})
          render json: {customer_info:CustomerSerializer.new(new_customer), token:customer_token}
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

  def permit_register
    params.permit(:name,:email,:password)
  end
end
