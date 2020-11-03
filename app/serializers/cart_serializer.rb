class CartSerializer < ActiveModel::Serializer
  attributes :id, :serialized_products, :total_price, :nice_timestamp

end
