class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.date :cart_date, null: false
      t.integer :cart_total, null: false

      t.timestamps
    end
  end
end
