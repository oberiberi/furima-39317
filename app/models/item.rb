class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :buy
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_price
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :standard_send_date

  validates :text, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" } 
end
