class CreateCartItems < ActiveRecord::Migration[7.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product_part_variant, null: false, foreign_key: true
      t.integer :cart_item_quantity, null: false
      t.integer :cart_item_price, null: false

      t.timestamps
    end
  end
end
