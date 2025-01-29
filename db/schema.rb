# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_01_28_224221) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_part_variant_id", null: false
    t.integer "cart_item_quantity", null: false
    t.integer "cart_item_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_part_variant_id"], name: "index_cart_items_on_product_part_variant_id"
  end

  create_table "carts", force: :cascade do |t|
    t.date "cart_date", null: false
    t.integer "cart_total", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incompatibilities", force: :cascade do |t|
    t.boolean "incompatibility_is_active", default: true, null: false
    t.bigint "part_variant_id1_id", null: false
    t.bigint "part_variant_id2_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_variant_id1_id"], name: "index_incompatibilities_on_part_variant_id1_id"
    t.index ["part_variant_id2_id"], name: "index_incompatibilities_on_part_variant_id2_id"
  end

  create_table "part_variants", force: :cascade do |t|
    t.string "part_variant_name", null: false
    t.bigint "part_id", null: false
    t.bigint "variant_id", null: false
    t.boolean "is_global_out_of_stock", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_part_variants_on_part_id"
    t.index ["variant_id"], name: "index_part_variants_on_variant_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "part_name", null: false
    t.boolean "part_is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_part_variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "part_variant_id", null: false
    t.boolean "product_part_variant_in_stock", default: true, null: false
    t.integer "product_part_variant_price_delta", default: 0, null: false
    t.string "product_part_variant_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_variant_id"], name: "index_product_part_variants_on_part_variant_id"
    t.index ["product_id"], name: "index_product_part_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name", null: false
    t.boolean "product_is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variants", force: :cascade do |t|
    t.string "variant_name", null: false
    t.boolean "variant_is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "product_part_variants"
  add_foreign_key "incompatibilities", "part_variants", column: "part_variant_id1_id"
  add_foreign_key "incompatibilities", "part_variants", column: "part_variant_id2_id"
  add_foreign_key "part_variants", "parts"
  add_foreign_key "part_variants", "variants"
  add_foreign_key "product_part_variants", "part_variants"
  add_foreign_key "product_part_variants", "products"
end
