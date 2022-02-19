class RemoveAdminFromCustomers < ActiveRecord::Migration[5.2]
  def up
    remove_column :customers, :Admin, :boolean
  end
end
