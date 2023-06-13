require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'クレジットカードの情報入力' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end
    # user_id: user.id, item_id: item.id
    context 'クレジットカード情報と発送先の情報の入力が問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end
    context 'クレジットカード情報と発送先の情報の入力ができない場合' do
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が必須であること' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列でなければ登録できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '発送元の地域が必須であること' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須であること' do
        @order.municipality = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が必須であること' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること' do
        @order.telephon_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephon number can't be blank")
      end
      it '電話番号は、半角数値以外を含んでいるものは登録できない' do
        @order.telephon_number = 'asTTTSSS123'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephon number is invalid')
      end
      it '電話番号は、9桁以下では登録できない' do
        @order.telephon_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephon number is invalid')
      end
      it '電話番号は、12桁以上では登録できない' do
        @order.telephon_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephon number is invalid')
      end
      it 'user_idが必須であること' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが必須であること' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
