class Buy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :send_address

  # validates :card_number, :expiration_date_month, :expiration_date_year, :security_code, presence: true
end
