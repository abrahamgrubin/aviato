# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.destroy_all
Bookmark.destroy_all
Hashtag.destroy_all

u = User.new(email: 'foo@bar.com', password: 'password', name: 'foo')
u.skip_confirmation! && u.save


20.times do
  u.bookmarks.create(title: Faker::DizzleIpsum.words(5), content: "##{Faker::HipsterIpsum.words}")
end

