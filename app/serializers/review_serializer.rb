class ReviewSerializer < ActiveModel::Serializer
  attributes :headline,:content,:rating, :customer_name, :product_id
end
