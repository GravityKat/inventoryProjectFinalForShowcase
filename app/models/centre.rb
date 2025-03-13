class Centre < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 65 }  # ✅ Ensures max 65 characters
end