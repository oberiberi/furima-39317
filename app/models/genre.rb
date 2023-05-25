class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '商品の状態' },
    { id: 2, name: '配送料の負担' },
    { id: 3, name: '配送元の地域' },
    { id: 4, name: '配送日の目安' },
    { id: 5, name: 'カテゴリー' },
  ]

  include ActiveHash::Associations
  has_many :articles

  end