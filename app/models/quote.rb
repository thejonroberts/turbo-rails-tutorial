class Quote < ApplicationRecord
  validates :name, presence: true

  scope :desc_id_ordered, -> { order(id: :desc) }
end
