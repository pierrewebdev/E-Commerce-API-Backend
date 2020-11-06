class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :image

  has_many :reviews
end
