class CreatePartVariants < ActiveRecord::Migration[7.2]
  def change
    create_table :part_variants do |t|
      t.string :part_variant_name, null: false
      t.references :part, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true
      t.boolean :is_global_out_of_stock, null: false, default: false

      t.timestamps
    end
  end
end
