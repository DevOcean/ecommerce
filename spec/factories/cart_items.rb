FactoryBot.define do
  factory :cart_item do
    cart { nil }
    product_part_variant_id { 1 }
    cart_item_quantity { 1 }
    cart_item_price { 1 }
  end
end
