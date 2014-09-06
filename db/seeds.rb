# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

User.destroy_all
Bookmark.destroy_all
Hashtag.destroy_all

u = User.create(email: 'foo@bar.com', password: 'password', name: 'foo')

20.times do
  hashtags = Faker::HipsterIpsum.words.map { |tag| "##{tag}" }.join(' ')
  bookmark = u.bookmarks.create(title: Faker::DizzleIpsum.words(5).join(' '), content: hashtags)
  HashtagExtractor.new(u, bookmark).create_hashtags
end
