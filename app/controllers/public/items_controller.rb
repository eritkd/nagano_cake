class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def create
    cart_item = Cart_item.new(cart_item_params)
    cart_item.save
    redirect_to public_item_path
  end
  
  private
  
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  def item_params
    params.require(:item).permit(:image,:genre_id,:name,:introduction,:price,:is_active)
  end
end
