class Quote < ApplicationRecord
  validates :name, presence: true

  scope :desc_id_ordered, -> { order(id: :desc) }

  # QUESTIONS:
    # - how to limit access / specify policy for channels?
    # - how to test
  # after_create_commit -> { broadcast_prepend_to "quotes", target: "quotes", partial: "quotes/quote", locals: { quote: self } }
  after_create_commit -> { broadcast_prepend_to "quotes" }
end
