class Quote < ApplicationRecord
  belongs_to :company
  has_many :line_item_dates, dependent: :destroy #, strict_loading: true

  validates :name, presence: true

  scope :desc_id_ordered, -> { order(id: :desc) }

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
