FactoryBot.define do
  factory :order do
    token                   { 'tok_abcdefghijk00000000000000000' }
    post_code               { '123-4567' }
    prefecture_id           { 2 }
    municipality            { '横浜市中央区' }
    address                 { '青山１ー１' }
    building_name           { '柳ビルディング101' }
    telephon_number         { '09042421212' }
  end
end
