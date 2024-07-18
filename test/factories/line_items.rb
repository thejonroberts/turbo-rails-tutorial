FactoryBot.define do
  factory :line_item do
    association :line_item_date

    name { "Test Line Item" }
    description { "Test line item description" }
    quantity { rand(1..10) }
    unit_price { rand(100..1000) }
  end
end
