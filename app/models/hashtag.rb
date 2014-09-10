class Hashtag < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark
  # validates :name, presence: true

  has_many :hashtaggings 
  has_many :bookmarks, through: :hashtaggings

  #if hashtag == hashtag.new then add the created bookmark to the hashtag.  
end
