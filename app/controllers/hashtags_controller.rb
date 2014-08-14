class HashtagsController < ApplicationController

  def index
    @hashtags = SimpleHashtag::Hashtag.all
  end

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
    @hashtagged = @hashtag.hashtaggables if @hashtag
  end
  
  def destroy 
     @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
     if @hashtag.destroy
     	flash[:notice] = "\"#{@hashtag}\" was deleted successfully."
      redirect_to hashtags_path
    else
      flash[:error] = "There was an error deleting the hashtag."
      render :index
    end
  end

end
