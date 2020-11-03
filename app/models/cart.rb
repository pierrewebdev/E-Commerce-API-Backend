class Cart < ApplicationRecord
  belongs_to :customer

  has_many :cart_products
  has_many :products, through: :cart_products

  def serialized_products
    products = self.products
    products.map{|product| ProductSerializer.new(product)}
  end

  def total_price
    self.products.sum(:price)
  end

  def nice_timestamp
    self.updated_at.strftime("%b #{updated_at.day.ordinalize} %Y")
  end


end
