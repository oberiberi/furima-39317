FactoryBot.define do
  factory :item do                 
    item_name             { Faker::Lorem.words(number: 2). join(' ') } 
    content               { Faker::Lorem.paragraph }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_price_id     { 2 }
    prefecture_id         { 2 }
    standard_send_date_id { 2 }
    price                 { 500 }
  
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
