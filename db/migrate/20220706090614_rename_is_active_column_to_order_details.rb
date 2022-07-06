class RenameIsActiveColumnToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_column :order_details, :is_active, :making_status
  end
end
