class Bookmark < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable 
  hashtaggable_attribute :content
  belongs_to :user
  validates :title, presence: true, length: { minimum: 4}


end
