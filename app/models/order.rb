class Order
  include ActiveModel::Model
  attr_accessor :card_number, :expiration_date_month, :expiration_date_year, :security_code, :post_code, :prefecture_id, :municipality, :address, :building_name, :telephon_number, :user_id, :item_id
 
with_options presence: true do
  validates :card_number, :expiration_date_month, :expiration_date_year, :municipality, :address, :telephon_number

  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
   buy = Buy.create(buy_params)   
    # ※各テーブルにデータを保存する処理を書く
   send_address = SendAaddress.create(send_address_params)
    # ※各テーブルにデータを保存する処理を書く
  end
 end