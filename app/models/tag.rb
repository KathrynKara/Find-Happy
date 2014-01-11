class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :comments, through: :users
  has_many :users

  validates :title, :category, :comment, :address, presence: true

  CATEGORIES = %w[Food Drink Sight Store]

  def self.search_for query
    where('title ILIKE :query
      OR category ILIKE :query
      OR address ILIKE :query 
      OR comment ILIKE :query', 
      query: "%#{query}%")
  end

  # geocoded_by :title
  # after_validation :geocode, :if => :address_changed?

  # attr_accessible :address, :latitude, :longitude
  geocoded_by :location
  def location
    # [title, address].compact.join(', ')
    "#{title} #{address}"
  end
  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }
end
