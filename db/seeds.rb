# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
CartItem.destroy_all
Cart.destroy_all
ProductPartVariant.destroy_all
PartVariant.destroy_all
Variant.destroy_all
Product.destroy_all
Part.destroy_all
Incompatibility.destroy_all

# Seed Variants
variant1 = Variant.create!(variant_name: "Red", variant_is_active: true)
variant2 = Variant.create!(variant_name: "Blue", variant_is_active: true)

# Seed Parts
part1 = Part.create!(part_name: "Frame", part_is_active: true)
part2 = Part.create!(part_name: "Wheels", part_is_active: true)

# Seed Part Variants
part_variant1 = PartVariant.create!(part_variant_name: "Red Frame", part: part1, variant: variant1, is_global_out_of_stock: false)
part_variant2 = PartVariant.create!(part_variant_name: "Blue Frame", part: part1, variant: variant2, is_global_out_of_stock: false)
part_variant3 = PartVariant.create!(part_variant_name: "Small Wheels", part: part2, variant: variant1, is_global_out_of_stock: false)

# Seed Products
product1 = Product.create!(product_name: "Bicycle", product_is_active: true)
product2 = Product.create!(product_name: "Scooter", product_is_active: true)

# Seed ProductPartVariants
product_part_variant1 = ProductPartVariant.create!(product: product1, part_variant: part_variant1, product_part_variant_in_stock: true, product_part_variant_price_delta: 50, product_part_variant_name: "Bicycle with Red Frame")
product_part_variant2 = ProductPartVariant.create!(product: product2, part_variant: part_variant3, product_part_variant_in_stock: true, product_part_variant_price_delta: 30, product_part_variant_name: "Scooter with Small Wheels")

# Seed Incompatibilities
incompatibility1 = Incompatibility.create!(incompatibility_is_active: true, part_variant_id1_id: part_variant1.id, part_variant_id2_id: part_variant3.id)

# Seed Carts
cart1 = Cart.create!(cart_date: Date.today, cart_total: 100)
cart2 = Cart.create!(cart_date: Date.today, cart_total: 200)

# Seed CartCartItems
CartItem.create!(cart: cart1, product_part_variant_id: product_part_variant1.id, cart_item_quantity: 1, cart_item_price: 50)
CartItem.create!(cart: cart2, product_part_variant_id: product_part_variant2.id, cart_item_quantity: 2, cart_item_price: 60)

puts "Database seeded successfully!"