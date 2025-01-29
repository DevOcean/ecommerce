class CreateIncompatibilities < ActiveRecord::Migration[7.2]
  def change
    create_table :incompatibilities do |t|
      t.string :incompatibility_desc
      t.boolean :incompatibility_is_active
      t.integer :part_variant_id1
      t.integer :part_variant_id2

      t.timestamps
    end
  end
end
