class DestinationCategory < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :destination, optional: true
  has_many :images
end
