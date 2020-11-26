# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
CartProduct.destroy_all
Cart.destroy_all
Customer.destroy_all
Product.destroy_all

Review.reset_pk_sequence
CartProduct.reset_pk_sequence
Cart.reset_pk_sequence
Customer.reset_pk_sequence
Product.reset_pk_sequence


require "csv"

def parse_data
    csv_data = CSV.read("db/health-and-fitness-ecomm-data.csv")
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

#some product reviews to test the output coming from the backend

product_one_review1 = Review.create(
    customer:Customer.first, 
    product: Product.first,
    headline: "I love this product!!!",
    content: "This product was exactly what I needed in these trying times. This really helped me to step up my at home workouts and get a better workout than I would get in the gym. I would recommmend this to any one of my friends",
    rating:5 
)

product_one_review2 = Review.create(
    customer:Customer.first, 
    product: Product.second,
    headline: "This product was okay but I had some issues...",
    content: "I enjoyed using this product but it showed up to my door really late which was really annoying to deal with. I tried to call the seller's number to find out what was going on but no one would ever pick up. It's just good that I finally got it becasue I was about to ask for a refund",
    rating:2 
)

puts "I seeded the database!!!"
