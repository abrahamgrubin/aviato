class Bookmark < ActiveRecord::Base
include SimpleHashtag::Hashtaggable 
belongs_to :user

end
