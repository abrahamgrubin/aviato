class Hashtagging < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :hashtag
end
