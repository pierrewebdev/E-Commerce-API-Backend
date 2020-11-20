class CartProductSerializer < ActiveModel::Serializer
  attributes :id, :product, :quantity
end
