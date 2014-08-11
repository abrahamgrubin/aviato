class BookmarksController < ApplicationController
  def index
    @bookmark = current_user.bookmarks
    
  end 

  def create
    @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:title, :content))
    if @bookmark.save
      redirect_to bookmarks_path
    end
  end
  
  def new 
  	@bookmark = Bookmark.new
  end
end
