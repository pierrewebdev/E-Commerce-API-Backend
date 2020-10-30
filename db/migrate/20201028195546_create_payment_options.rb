class CreatePaymentOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_options do |t|
      t.integer :card_number
      t.string :billing_address
      t.datetime :expiration_date
      t.belongs_to :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
