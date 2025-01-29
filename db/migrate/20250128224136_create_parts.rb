class CreateParts < ActiveRecord::Migration[7.2]
  def change
    create_table :parts do |t|
      t.string :part_name
      t.boolean :part_is_active

      t.timestamps
    end
  end
end
