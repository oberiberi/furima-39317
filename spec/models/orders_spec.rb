require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe 'クレジットカードの情報入力' do
    context 'クレジットカードの情報が入力できる場合' do
      it 'card_number, expiration_date_month, expiration_date_year, security_code, post_code, prefecture, municipality, address, elephon_numberが存在すれば登録できる' do
        expect(@order).to be_valid
      end
    end
    context 'クレジットカードの情報が入力できない場合' do
      it 'カード番号が必須であること' do
        @order.card_number= nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Card_number can't be blank")
      end
      it '有効期限が必須であること' do
        @order.expiration_date_month = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Expiration_date_month can't be blank")
      end
      it 'セキュリティコードが必須であること' do
        @order.security_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Security_code can't be blank")
      end
      it '郵便番号が必須であること' do
        @order.post_code = nil
        @orders.valid?
        expect(@order.errors.full_messages).to include("Post_code can't be blank")
      end
      it '郵便番号は、半角数値以外を含んでいるものは登録できない' do
        @order.post_code = 'AaあBbかｶ'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post_code is not a number')
      end
      it '郵便番号は、「3桁ハイフン4桁」でなければ登録できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post_code is invalid. Include hyphen(-)')
      end
      # <※変更ずみ>
      it '発送元の地域が必須であること' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が必須であること' do
        @order.municipality = nil
        @orders.valid?
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
        expect(@order.errors.full_messages).to include("Telephon_number can't be blank")
      end
      it '電話番号は、半角数値以外を含んでいるものは登録できない' do
        @order.telephon_number = 'AaあBbかｶ'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephon_number is not a number')
      end
      it '電話番号は、9桁以下では登録できない' do
        @order.telephon_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephon_number is too short (minimum is 10 characters)')
      end
      it '電話番号は、12桁以上では登録できない' do
        @order.telephon_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephon_number is too long (maximum is 11 characters)')
      end
end
