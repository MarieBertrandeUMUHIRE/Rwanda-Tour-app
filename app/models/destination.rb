class Destination < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  belongs_to :region, optional: true
  belongs_to :category
  has_many :images

  validates :name , presence: true
  validates :description , presence: true
  validates :user_id, presence: true
  validates :region_id, presence: true
  validates :category_id, presence: true
end

