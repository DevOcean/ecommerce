FactoryBot.define do
  factory :part_variant do
    part_variant_name { "MyString" }
    part { nil }
    variant { nil }
    is_global_out_of_stock { false }
  end
end
