class CreateIncompatibilities < ActiveRecord::Migration[7.2]
  def change
    create_table :incompatibilities do |t|
      t.boolean :incompatibility_is_active, null: false, default: true
      t.references :part_variant_id1, null: false, foreign_key: { to_table: :part_variants }
      t.references :part_variant_id2, null: false, foreign_key: { to_table: :part_variants }

      t.timestamps
    end
  end
end
