class Bookmark < ActiveRecord::Base

  belongs_to :user
  validates :title, presence: true, length: { minimum: 4 }
  has_many :hashtaggings 
  has_many :hashtags, through: :hashtaggings
  
end
