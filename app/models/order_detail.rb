class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_statuses: { not_maked: 0, wait_maked: 1, now_maked: 2, fin_maked: 3 }
end
