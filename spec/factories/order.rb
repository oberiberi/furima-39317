FactoryBot.define do
  factory :order do
    card_number             { '1234567890123456' }
    expiration_date_month   { 6 }
    expiration_date_year    { 23 }
    security_code           { 321 }
    post_code               { 123-4567 }
    prefecture_id           { 2 }
    municipality            { 東京都港区 }
    address                 { 青山１ー１}
    building_name           { 柳ビルディング101 }
    telephon_number         { '09042421212' }
  end
end
