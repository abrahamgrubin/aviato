class HashtagExtractor

  attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user, @bookmark = user, bookmark 
  end
  
  def extract_hashtags
    regex = /\B#\w*[a-zA-Z]+\w*/
    bookmark.content.scan(regex)
  end

  def create_hashtags
    hashtags = extract_hashtags
    hashtags.each do |hashtag|
      hashtag = Hashtag.where(name: hashtag).first_or_create
      bookmark.hashtaggings.create(hashtag_id: hashtag.id)
    end
  end

end
