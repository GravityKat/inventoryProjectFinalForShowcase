class Item < ApplicationRecord
  belongs_to :centre
  belongs_to :category, optional: true

  # Allow searching category name via Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[centre category]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end
end