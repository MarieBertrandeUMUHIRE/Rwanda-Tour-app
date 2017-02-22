class Category < ApplicationRecord
  has_many :destination_categories
  has_many :destinations, through: :destination_categories
end
