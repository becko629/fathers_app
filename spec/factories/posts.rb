FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    category_id { Faker::Number.between(to: 11) }
    prefecture_id { Faker::Number.between(to: 48) }

    association :user
  end
end