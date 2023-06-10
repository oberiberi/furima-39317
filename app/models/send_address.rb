class SendAddress < ApplicationRecord
  belongs_to :buy
  has_one_active_hash :prefecture
  
  validates :post_code, prefecture, municipality, address, building_name, telephon_number, presence: true
end
