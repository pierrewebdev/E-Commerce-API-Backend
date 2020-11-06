class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.string :headline
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
