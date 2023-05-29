class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true

         with_options presence: true do
              # ひらがな、カタカナ、漢字のみ許可する
              validates :name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
              # カタカナのみ許可する
              validates :name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
              # # 半角英字数字のみ許可する
              # validates :nickname, format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}

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
              it ' パスワードは、半角英数字混合での入力が必須であること' do
                     @user.password = format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
                     @user.valid?
                     validates :password, format: {with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}
            end
  end

