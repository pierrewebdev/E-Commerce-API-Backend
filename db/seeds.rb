# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


CartProduct.destroy_all
Cart.destroy_all
Customer.destroy_all
Product.destroy_all

CartProduct.reset_pk_sequence
Cart.reset_pk_sequence
Customer.reset_pk_sequence
Product.reset_pk_sequence


require "csv"

def parse_data
    csv_data = CSV.read("/Users/patrickpierre/Development/code/personal_projects/health-and-fit-ecom/health_and_fit_api/db/health-and-fitness-ecomm-data.csv")
    csv_data.shift
    # iterate over each element and send back a hash 
    # need to shift again at the beginning to get rid of id on the row
    ecomm_object_array = []
    csv_data.each do |ecomm_row_arr|
        ecomm_row_arr.shift
        ecomm_object = {
            :image => ecomm_row_arr[0],
            :description => ecomm_row_arr[1],
            :name => ecomm_row_arr[2],
            :price => rand(25.00..61.00)
        }
        ecomm_object_array.push(ecomm_object)  
    end
    ecomm_object_array.flatten
end

#seed some sample user and  product data

Customer.create(name:"Patrick Pierre",email:"patrick.pierre000@gmail.com",password:"my_yute")
Cart.create(customer:Customer.first, save_for_later:false, checked_out:false)

Product.create!(parse_data)

puts "I seeded the database!!!"
