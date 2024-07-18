FactoryBot.define do
  factory :user do
    association :company

    sequence(:email) { |n| "person-#{n}@example.com" }
    password { "password" }
  end
end
