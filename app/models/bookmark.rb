class Bookmark < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable 
  hashtaggable_attribute :content
  belongs_to :user
  after_save :webify

  def webify
  	if self.title.include?("https://")
  		"#{title}"
  	else
  		"https://#{title}"
  	end
  end

end
