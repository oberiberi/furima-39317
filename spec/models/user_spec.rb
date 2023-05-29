require 'rails_helper'




RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do  
    with_options presence: true do
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
      @user.last_name_kana,first_name_kana = '漢字・ひらがな・カタカナ'   # ひらがな、カタカナ、漢字のみ許可する
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid. invalid. Input full-width characters.")
    end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力でなければ登録できない' do
        @user.name_kana = 'カタカナ'   # カタカナのみ許可する
        @user.valid?
        expect(@user.errors.full_messages).to include("Name_kana is invalid. Input full-width katakana characters.")
      end
    end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'password123' # 半角英数字混合のパスワード
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
    end    
  end
end
