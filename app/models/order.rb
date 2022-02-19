class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  enum pay_status: { credit_card: 0, transfer: 1 }
  enum order_status: { wait_pay: 0, check_pay: 1, in_production: 2, preparing_ship: 3, shipped: 4 }
end
