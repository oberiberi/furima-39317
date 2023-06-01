FactoryBot.define do
  factory :item do
    name { Faker::Team.name }
    association :user
    association :buy
  end
end
