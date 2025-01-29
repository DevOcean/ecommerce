class IncompatibilitiesController < ApplicationController
  def index
    @incompatibilities = Incompatibility.all
    render json: @incompatibilities
  end

  def show
    @incompatibility = Incompatibility.find(params[:id])
    render json: @incompatibility
  end

  def create
    @incompatibility = Incompatibility.new(incompatibility_params)
    if @incompatibility.save
      render json: @incompatibility, status: :created
    else
      render json: @incompatibility.errors, status: :unprocessable_entity
    end
  end

  def update
    @incompatibility = Incompatibility.find(params[:id])
    if @incompatibility.update(incompatibility_params)
      render json: @incompatibility
    else
      render json: @incompatibility.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @incompatibility = Incompatibility.find(params[:id])
    @incompatibility.destroy
    head :no_content
  end

  private

  def incompatibility_params
    params.require(:incompatibility).permit(:incompatibility_desc, :incompatibility_is_active, :part_variant_id1, :part_variant_id2)
  end
end
