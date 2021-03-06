class Cart < ApplicationRecord
  belongs_to :customer

  has_many :cart_products
  has_many :products, through: :cart_products

  def serialized_products
    products = self.cart_products
    products.map{|product| CartProductSerializer.new(product)}
  end

  def nice_timestamp
    self.updated_at.strftime("%b #{updated_at.day.ordinalize} %Y")
  end


end
