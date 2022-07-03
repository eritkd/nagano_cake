class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    if order.save
      redirect_to public_orders_complete_path
    else
      redirect_to public_items_path
    end
  end
    

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    if params[:order][:select_address] == "1"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "2"
      @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    else params[:order][:select_address] == "3"
    end
  end


  def complete
  end

  def index
    @orders = Order.all
    
  end

  def show
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    binding.pry 
  end
  
  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to public_items_path
  end

private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:postage,:payment,:payment_method,:cart_item_id)
  end

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:postal_code,:address)
  end
end