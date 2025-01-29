class CreateVariants < ActiveRecord::Migration[7.2]
  def change
    create_table :variants do |t|
      t.string :variant_name
      t.boolean :variant_is_active

      t.timestamps
    end
  end
end
