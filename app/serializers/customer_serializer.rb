class CustomerSerializer < ActiveModel::Serializer
  attributes :id,:name,:email, :current_cart, :past_carts
end
