class Bookmark < ActiveRecord::Base
  belongs_to :user
  validates :title,
    presence: true, length: { minimum: 4 },
    uniqueness: true
  has_many :hashtaggings 
  has_many :hashtags, through: :hashtaggings
  
  def extract_hashtags
    regex = /\B#\w*[a-zA-Z]+\w*/
    self.content.scan(regex)
  end
 
end
