class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 学習メモ：半角英字数字のみ許可する
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true do
    validates :nickname
    validates :birth_date

    # 学習メモ：ひらがな、カタカナ、漢字のみ許可する
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    # 学習メモ：カタカナのみ許可する
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/ }
  end
end
