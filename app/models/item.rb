class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # has_one :buy
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_price
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :standard_send_date
  has_one_attached :image

  validates :item_name, :category_id, :condition_id, :delivery_price_id, :prefecture_id, :standard_send_date_id,  presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_price_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :standard_send_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
