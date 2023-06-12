class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :building_name, :telephon_number, :user_id, :item_id
  #  ※attr_accessorのところに、後でtokenを入力 

with_options presence: true do
  validates :municipality, :address
  validates :user_id, :item_id
  # validates :token, presence: true
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  validates :telephon_number, format: {with: /\A0\d{9,10}\z/, multiline: true }
end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
   buy = Buy.create(user_id: user_id, item_id: item_id)   
    # ※各テーブルにデータを保存する処理を書く
   send_address = SendAddress.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephon_number: telephon_number, buy_id: buy.id)
    # ※各テーブルにデータを保存する処理を書く
  end
 end