class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
  end

  def complete
  end

  def index
  end

  def show
  end

private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:postal_code,:address)
  end

end
