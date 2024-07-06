class Quote < ApplicationRecord
  belongs_to :company
  has_many :line_item_dates, dependent: :destroy # TODO, strict_loading: true
  has_many :line_items, through: :line_item_dates

  validates :name, presence: true

  scope :desc_id_ordered, -> { order(id: :desc) }

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  def total_price
    line_items.sum(&:total_price)
  end
end
