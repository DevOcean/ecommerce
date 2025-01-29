class ProductPartVariantsController < ApplicationController
  def index
    @product_part_variants = ProductPartVariant.all
    render json: @product_part_variants
  end

  def show
    @product_part_variant = ProductPartVariant.find(params[:id])
    render json: @product_part_variant
  end

  def create
    @product_part_variant = ProductPartVariant.new(product_part_variant_params)
    if @product_part_variant.save
      render json: @product_part_variant, status: :created
    else
      render json: @product_part_variant.errors, status: :unprocessable_entity
    end
  end

  def update
    @product_part_variant = ProductPartVariant.find(params[:id])
    if @product_part_variant.update(product_part_variant_params)
      render json: @product_part_variant
    else
      render json: @product_part_variant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product_part_variant = ProductPartVariant.find(params[:id])
    @product_part_variant.destroy
    head :no_content
  end

  private

  def product_part_variant_params
    params.require(:product_part_variant).permit(:product_id, :part_variant_id, :product_part_variant_in_stock, :product_part_variant_price_delta, :product_part_variant_name)
  end
end
