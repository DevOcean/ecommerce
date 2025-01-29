class CreateProductPartVariants < ActiveRecord::Migration[7.2]
  def change
    create_table :product_part_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.references :part_variant, null: false, foreign_key: true
      t.boolean :product_part_variant_in_stock
      t.integer :product_part_variant_price_delta
      t.string :product_part_variant_name

      t.timestamps
    end
  end
end
