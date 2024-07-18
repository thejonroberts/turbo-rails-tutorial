FactoryBot.define do
  factory :line_item_date do
    association :quote

    sequence(:date) { |n| Date.current + n.days }

    # has many associations
    trait :with_line_item do
      line_items { [association(:line_item)] }
    end
  end
end
