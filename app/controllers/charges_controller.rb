#boiler plate code to set up a basic transaction using stripe
require 'stripe'
class ChargesController < ApplicationController
    def create
        # byebug
        Stripe.api_key = ENV['stripe_api_key']
        token = params[:charge][:token]
        price = params[:price]
        charge = Stripe::Charge.create({
            amount: price,
            currency: 'usd',
            source: token,
            description: 'Test Charge!',
        })
        render json: charge
    end
end


















# class ChargesController < ApplicationController
#   def create
#     byebug
#     #pass in the API key here from the environment variable
#     Stripe.api_key = ENV["stripe_api_key"]
    
#     # The token will be given as a property in an object called charge that will be invoked as a prop in the StripeCheckout component of the React front-end
#     token = params[:charge][:token]

#     #The price will come as part of the body of a fetch request that will be sent to this backend
#     price = params[:price]
    
#     #the code below will abstract the process of creating the charge in the stripe api using the stripe gem
#     charge = Stripe::Charge.create({
#         #the object keys we use have to match what is in th stripe api documentation to work properly
#         amount: price,
#         currency: "usd",
#         source: token,
#         description: "Test Charge"
#     })
    
#     #render the result to the front end to see if it actually worked
#     render json: charge
#   end


# end
