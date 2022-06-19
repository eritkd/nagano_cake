class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id]) 
  end
  
  def unsubscribe
    @customer = Customer.find(params[:id])
  end
  
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email)
  end
  def genre_params
    params.require(:genre).permit(:name)
  end
end
