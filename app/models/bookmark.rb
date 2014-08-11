class Bookmark < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable 
  hashtaggable_attribute :content
  belongs_to :user

end
