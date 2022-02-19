class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :postage
      t.integer :price, null: false
      t.integer :pay_status, default: 0, null: false
      t.integer :order_status, default: 0, null: false
      t.integer :customer_id

      t.timestamps
    end
  end
end
