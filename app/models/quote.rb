class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :desc_id_ordered, -> { order(id: :desc) }

  # QUESTIONS:
    # - how to limit access / specify policy for channels?
    # - how to test
  # after_create_commit -> { broadcast_prepend_to "quotes", target: "quotes", partial: "quotes/quote", locals: { quote: self } }
  # after_create_commit -> { broadcast_prepend_later_to "quotes" }
  # after_update_commit -> { broadcast_replace_later_to "quotes" }
  # Can't use self.id to broadcast later.
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # The above three callbacks are equivalent to the following single line
  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend
end
