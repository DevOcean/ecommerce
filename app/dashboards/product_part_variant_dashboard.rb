require "administrate/base_dashboard"

class ProductPartVariantDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    part_variant: Field::BelongsTo,
    product: Field::BelongsTo,
    product_part_variant_in_stock: Field::Boolean,
    product_part_variant_name: Field::String,
    product_part_variant_price_delta: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    part_variant
    product
    product_part_variant_in_stock
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    part_variant
    product
    product_part_variant_in_stock
    product_part_variant_name
    product_part_variant_price_delta
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    part_variant
    product
    product_part_variant_in_stock
    product_part_variant_name
    product_part_variant_price_delta
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how product part variants are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product_part_variant)
  #   "ProductPartVariant ##{product_part_variant.id}"
  # end
end
