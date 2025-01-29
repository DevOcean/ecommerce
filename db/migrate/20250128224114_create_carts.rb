class CreateCarts < ActiveRecord::Migration[7.2]
  def change
    create_table :carts do |t|
      t.date :cart_date
      t.integer :cart_total

      t.timestamps
    end
  end
end
