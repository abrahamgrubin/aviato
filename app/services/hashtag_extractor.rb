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
      bookmark.hashtags.create(name: hashtag, user_id: user.id)
    end
  end

end
