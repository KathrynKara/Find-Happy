class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :comments, through: :users
  has_many :users

  validates :title, :category, :comment, presence: true

  CATEGORIES = %w[Food Drink Sight Store]

  # attr_accessible :address, :latitued, :longitude
  # geocoded_by :full_street_address
  # after_validation :geocode, :if => :address_changed?
end
