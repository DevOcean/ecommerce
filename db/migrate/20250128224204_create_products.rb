class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.boolean :product_is_active, null: false, default: true

      t.timestamps
    end
  end
end
