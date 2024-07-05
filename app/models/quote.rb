class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :desc_id_ordered, -> { order(id: :desc) }

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
