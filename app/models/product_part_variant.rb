class ProductPartVariant < ApplicationRecord
  belongs_to :product
  belongs_to :part_variant
end
