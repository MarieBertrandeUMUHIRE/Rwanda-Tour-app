class Destination < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :region, optional: true
  has_many :destination_categories
  has_many :categories, through: :destination_categories
  has_many :images

  validates :name , presence: true
  validates :description , presence: true
  validates :user_id, presence: true
  validates :region_id, presence: true
  validates :category_id, presence: true
end

