class HashtagsController < ApplicationController
  require 'embedly'
  require 'json'

	def create 
	  
	end

	def show
	  # @hashtag = Hashtag.find(params[:id])
	  @bookmark = @hashtag.bookmarks
	  #@url = embedly_api.oembed(:url => @bookmark.first.title) 
	end
    
    def index
       @hashtags = current_user.hashtags
       
    end 
	def destroy 
	end

	def update 
	end 

 private 

  def embedly_api
    Embedly::API.new :key => ENV['EMBEDLY_KEY']
  end

end 