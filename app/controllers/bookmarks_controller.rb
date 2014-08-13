class BookmarksController < ApplicationController
 
  require 'embedly'
  require 'json'

  def index
    @bookmark = current_user.bookmarks
  end 
  
  def show
    @bookmark = current_user.bookmarks.find(params[:id])
    @url = embedly_api.oembed(:url => @bookmark.title).first 
  end  

  def create
    @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:title, :content))
    if @bookmark.save
      redirect_to bookmarks_path, notice: "Bookmark Saved"
    else
      flash[:error] = "There was an error saving your bookmark, please try again"
    end 
  end
  
  def new 
  	@bookmark = Bookmark.new
  end

  def destroy
    @bookmark = current_user.bookmarks.find(params[:id])
    @title = @bookmark.title
    if @bookmark.destroy
      flash[:notice] = "\"#{@title}\" was deleted successfully."
      redirect_to bookmarks_path
    else
      flash[:error] = "There was an error deleting the bookmark."
      render :index
    end
  end

  private 

  def embedly_api
    Embedly::API.new :key => ENV['EMBEDLY_KEY']
  end

end
