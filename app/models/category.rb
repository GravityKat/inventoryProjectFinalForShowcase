class Category < ApplicationRecord
  has_many :items

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end
end
