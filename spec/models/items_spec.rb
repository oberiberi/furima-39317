require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    context '商品情報入力できる場合' do
      it 'image, item_name, content, category, condition, delivery_price, prefecture, standard_send_date, priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報入力できない場合' do
      it '商品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.content = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'カテゴリーが必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が必須であること' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が必須であること' do
        @item.delivery_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price can't be blank")
      end
      it '発送元の地域が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が必須であること' do
        standard_send_date = StandardSendDate.find_by(id: 1)
        @item.standard_send_date = standard_send_date
        @item.valid?
        expect(@item.errors.full_messages).to include("Standard send date can't be blank")
      end
      it '販売価格が必須であること' do
        @item.price= nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は、半角数値以外を含んでいるものは登録できない' do
        @item.price = 'AaあBbかｶ' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が299円以下では登録できない' do
        @item.price= 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が9999999円以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'userが紐づいていない場合登録できない' do
          item = Item.new
          expect(item).not_to be_valid
          expect(item.errors[:user]).to include("must exist")
        end 
    end
  end
end
