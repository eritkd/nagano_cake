class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @posts = Item.page(params[:page]).per(8) 
    
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def create
    cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if cart_item.save
    redirect_to public_cart_items_path
    else
    redirect_to public_items_path
    end
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :image, :price)
  end
  
  def item_params
    params.require(:item).permit(:image,:genre_id,:name,:introduction,:price,:is_active)
  end
end
