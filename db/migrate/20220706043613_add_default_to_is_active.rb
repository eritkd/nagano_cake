class AddDefaultToIsActive < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :is_active,:integer, default: 0
  end
end
