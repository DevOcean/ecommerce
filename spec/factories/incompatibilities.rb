FactoryBot.define do
  factory :incompatibility do
    incompatibility_desc { "MyString" }
    incompatibility_is_active { false }
    part_variant_id1 { 1 }
    part_variant_id2 { 1 }
  end
end
