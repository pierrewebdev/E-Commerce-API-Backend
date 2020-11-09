class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :product

  def customer_name
    self.customer.name
  end

  def product_id
    self.product.id
  end
end
