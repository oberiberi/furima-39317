class Item < ApplicationRecord
  has_one :buy
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :delivery_price
  belongs_to_active_hash :prefecture_id 
  belongs_to_active_hash :standard_send_date
end
