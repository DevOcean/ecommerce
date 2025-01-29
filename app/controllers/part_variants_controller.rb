class PartVariantsController < ApplicationController
  def index
    @part_variants = PartVariant.all
    render json: @part_variants
  end

  def show
    @part_variant = PartVariant.find(params[:id])
    render json: @part_variant
  end

  def create
    @part_variant = PartVariant.new(part_variant_params)
    if @part_variant.save
      render json: @part_variant, status: :created
    else
      render json: @part_variant.errors, status: :unprocessable_entity
    end
  end

  def update
    @part_variant = PartVariant.find(params[:id])
    if @part_variant.update(part_variant_params)
      render json: @part_variant
    else
      render json: @part_variant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @part_variant = PartVariant.find(params[:id])
    @part_variant.destroy
    head :no_content
  end

  private

  def part_variant_params
    params.require(:part_variant).permit(:part_variant_name, :part_id, :variant_id, :is_global_out_of_stock)
  end
end
