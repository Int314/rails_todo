FactoryBot.define do
  factory :todo do
    sequence(:id) { |n| "#{n}" }
    title { Faker::Lorem.sentence }
    completed { Faker::Boolean.boolean }
  end
end
