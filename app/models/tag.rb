class Tag < ActiveRecord::Base
  belongs_to :user
  has_many :comments, through: :users
  has_many :users

  CATEGORIES = %w[Food Drink Sight Store]
end
