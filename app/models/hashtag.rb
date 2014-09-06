class Hashtag < ActiveRecord::Base
  # validates :name, presence: true, uniqueness: true
  has_many :hashtaggings 
  has_many :bookmarks, through: :hashtaggings
end
