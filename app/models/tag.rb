class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :comments, through: :users
  has_many :users

  validates :title, :category, :comment, presence: true

  CATEGORIES = %w[Food Drink Sight Sftore]

  # geocoded_by :title
  # after_validation :geocode, :if => :address_changed?

  # attr_accessible :address, :latitude, :longitude
  geocoded_by :location
  def location
    "#{title}, #{address}"
  end
  after_validation :geocode, :if => :address_changed?
end
