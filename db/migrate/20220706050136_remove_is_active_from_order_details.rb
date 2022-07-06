class RemoveIsActiveFromOrderDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_details, :name, :integer
  end
end
