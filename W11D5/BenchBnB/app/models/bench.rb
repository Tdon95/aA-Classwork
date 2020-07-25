class Bench < ApplicationRecord
  validates :description, :latitude, :longitude, presence: true

  has_many :reviews
  has_many :favorites
  has_many :favorite_users,
    through: :favorites,
    source: :user
    
# Active Storage Association
  has_one_attached :photo

  def self.in_bounds(bounds)
    self.where("latitude < ?", bounds[:northEast][:latitude])
      .where("latitude > ?", bounds[:southWest][:latitude])
      .where("longitude > ?", bounds[:southWest][:longitude])
      .where("longitude < ?", bounds[:northEast][:longitude])
  end

  def average_rating
    reviews.average(:rating)
  end
end
