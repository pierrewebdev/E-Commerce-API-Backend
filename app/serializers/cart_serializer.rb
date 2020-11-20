class CartSerializer < ActiveModel::Serializer
  attributes :id, :serialized_products, :nice_timestamp

end
