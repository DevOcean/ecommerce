FactoryBot.define do
  factory :product_part_variant do
    product { nil }
    part_variant { nil }
    product_part_variant_in_stock { false }
    product_part_variant_price_delta { 1 }
    product_part_variant_name { "MyString" }
  end
end
