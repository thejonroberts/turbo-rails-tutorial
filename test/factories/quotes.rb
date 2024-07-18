FactoryBot.define do
  factory :quote do
    association :company

    name { "Test quote" }

    # has many associations
    trait :with_line_item_date do
      line_item_dates { [association(:line_item_date)] }
    end

    trait :with_line_item do
      line_item_dates { [association(:line_item_date, :with_line_item)] }
    end
  end
end
