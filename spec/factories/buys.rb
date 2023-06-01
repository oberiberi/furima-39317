FactoryBot.define do
  factory :buy do
    content { Faker::Lorem.sentence }
    association :user
    association :buy
    association :shipping_address
  end
end
