class Destination < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :region, optional: true
  has_many :destination_categories
  has_many :categories, through: :destination_categories
  has_many :images
end

