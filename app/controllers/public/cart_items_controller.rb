class Public::CartItemsController < ApplicationController
  def index
    @customer = current_customer
    @cart_items = @customer.cart_items
  end
  
  def new
    @cart_item = CartItem.new
    @customer = current_customer
  end
  
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    if cart_item.save
    redirect_to public_cart_items_path
    else
    redirect_to public_items_path
    end
  end
  
  def destroy
  　cart_item = CartItem.find(params[:id])
  　cart_item.destroy
  　redirect_to public_items_path
  end
  
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :name)
  end
  
end
