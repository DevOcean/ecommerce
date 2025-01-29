class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    render json: @cart_items
  end

  def show
    @cart_item = CartItem.find(params[:id])
    render json: @cart_item
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      render json: @cart_item, status: :created
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      render json: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    head :no_content
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_part_variant_id, :cart_item_quantity, :cart_item_price)
  end
end
