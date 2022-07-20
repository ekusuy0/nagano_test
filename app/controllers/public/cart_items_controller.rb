class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    cart_item = current_customer.cart_items
    if cart_item.present?
      redirect_to public_cart_items_path
    else
      redirect_to public_items_path
    end
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to public_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    cart_item = CartItem.find_by(item_id: @cart_item.item_id)
    if cart_item.present?
      cart_item.update(quantity: cart_item.quantity.to_i + @cart_item.quantity.to_i)
    else
       @cart_item.save
    end
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
