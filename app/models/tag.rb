class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :comments, through: :users
  has_many :users

  validates :title, :category, :comment, :address, presence: true

  CATEGORIES = %w[Food Drink Sight Store]

  def self.search_for query
    where('title LIKE :query
      OR category LIKE :query
      OR address LIKE :query 
      OR comment LIKE :query', 
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
