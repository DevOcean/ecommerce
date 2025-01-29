class CreateVariants < ActiveRecord::Migration[7.2]
  def change
    create_table :variants do |t|
      t.string :variant_name, null: false
      t.boolean :variant_is_active, null: false, default: true

      t.timestamps
    end
  end
end
