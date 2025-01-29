class VariantsController < ApplicationController
  def index
    @variants = Variant.all
    render json: @variants
  end

  def show
    @variant = Variant.find(params[:id])
    render json: @variant
  end

  def create
    @variant = Variant.new(variant_params)
    if @variant.save
      render json: @variant, status: :created
    else
      render json: @variant.errors, status: :unprocessable_entity
    end
  end

  def update
    @variant = Variant.find(params[:id])
    if @variant.update(variant_params)
      render json: @variant
    else
      render json: @variant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @variant = Variant.find(params[:id])
    @variant.destroy
    head :no_content
  end

  private

  def variant_params
    params.require(:variant).permit(:variant_name, :variant_is_active)
  end
end
