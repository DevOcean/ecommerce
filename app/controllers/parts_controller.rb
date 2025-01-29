class PartsController < ApplicationController
  def index
    @parts = Part.all
    render json: @parts
  end

  def show
    @part = Part.find(params[:id])
    render json: @part
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      render json: @part, status: :created
    else
      render json: @part.errors, status: :unprocessable_entity
    end
  end

  def update
    @part = Part.find(params[:id])
    if @part.update(part_params)
      render json: @part
    else
      render json: @part.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    head :no_content
  end

  private

  def part_params
    params.require(:part).permit(:part_name, :part_is_active)
  end
end
