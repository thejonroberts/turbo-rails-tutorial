class Quote < ApplicationRecord
  belongs_to :company
  # NOTE: Cannot have db foreign key constraint to destroy_async.
  has_many :line_item_dates, dependent: :destroy_async
  has_many :line_items, through: :line_item_dates, dependent: :destroy_async

  validates :name, presence: true

  scope :desc_id_ordered, -> { order(id: :desc) }

  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  def total_price
    # NOTE: don't know of any way to preload except per call, and that gets tricky (in views)
    strict_loading!(false)
    price = line_items.reload.sum(&:total_price)
    strict_loading!(true) # ? better way to temporarily disable strict loading?
    price
  end
end
