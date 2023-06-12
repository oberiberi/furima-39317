class SendAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buy
  belongs_to_active_hash :prefecture
  
  # validates :post_code, prefecture, municipality, address, building_name, telephon_number, presence: true
end
