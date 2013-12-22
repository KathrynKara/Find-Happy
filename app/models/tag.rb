class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, through: :users
  has_many :users
end
