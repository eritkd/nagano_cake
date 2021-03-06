class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id]) 
  end
  
  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(customer.id)
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end
  
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: false)
    reset_session
    redirect_to root_path
  end
  
  def destroy
      @customer = Customer.find(params[:id]) 
      @customer.destroy
      flash[:notice] = 'ユーザーを削除しました。'
      redirect_to :root 
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:telephone_number,:email,:is_active)
  end
  def genre_params
    params.require(:genre).permit(:name)
  end
end
