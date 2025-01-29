class CreateParts < ActiveRecord::Migration[7.2]
  def change
    create_table :parts do |t|
      t.string :part_name, null: false
      t.boolean :part_is_active, null: false, default: true

      t.timestamps
    end
  end
end
