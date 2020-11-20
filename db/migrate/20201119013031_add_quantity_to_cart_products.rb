class AddQuantityToCartProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_products, :quantity, :integer
  end
end
