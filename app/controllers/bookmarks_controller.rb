class BookmarksController < ApplicationController
  respond_to :html, :js

  require 'embedly'
  require 'json'

  def index
    if hashtag_id = params[:tag]
      @bookmarks = Bookmark
        .joins(:hashtaggings)
        .where(["hashtaggings.hashtag_id = ? AND user_id = ?",
        hashtag_id, current_user.id])
    else
      @bookmarks = current_user.bookmarks
    end
  end 
  
  def show
    @bookmark = current_user.bookmarks.find(params[:id])
    @title = @bookmark.title
    @url = embedly_api.oembed(:url => @title).first
  end  

  def create
    @bookmark = current_user.bookmarks.build(params.require(:bookmark).permit(:title, :content))
    if @bookmark.save
      HashtagExtractor.new(current_user, @bookmark).create_hashtags
      binding.pry
      redirect_to @bookmark, notice: "Bookmark Saved"
    else
      flash[:error] = "There was an error saving your bookmark, please try again"
    end 

  end
  
  def new 
  	@bookmark = Bookmark.new
  end
   
   def update
    @bookmark = current_user.bookmarks.find(params[:id])
    if @bookmark.update_attributes(params.require(:bookmark).permit(:title, :content))
      redirect_to @bookmark
    else
      flash[:error] = "Error saving topic. Please try again"
      render :edit
    end
  end
  
  def edit 
    @bookmark = current_user.bookmarks.find(params[:id])
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

  #def get_host_without_www(url)
    #url = "http://#{url}" if URI.parse(url).scheme.nil?
    #host = URI.parse(url).host.downcase
    #host.start_with?('www.') ? host[4..-1] : host
  #end
end
