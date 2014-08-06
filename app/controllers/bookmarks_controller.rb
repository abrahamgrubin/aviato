class BookmarksController < ApplicationController
  def index
    @bookmark = Bookmark.all
  end 

  def new
    @bookmark = Bookmark.new 
  end

end
