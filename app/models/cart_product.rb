class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def serialized_product
    ProductSerializer.new(self.product)
  end
end
