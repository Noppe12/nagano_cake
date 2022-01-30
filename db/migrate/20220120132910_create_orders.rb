class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :postage
      t.integer :price
      t.integer :pay_status
      t.integer :order_status
      t.integer :customer_id

      t.timestamps
    end
  end
end
