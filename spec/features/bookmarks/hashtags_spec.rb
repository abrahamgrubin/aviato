require 'spec_helper'



feature 'Hashtags' do 
	background do 
	@user = FactoryGirl.create(:user)
  end
  scenario 'user creates bookmark with hashtag' do 
    visit root_path
    login(@user)
    click_link 'Create Bookmark'
    fill_in 'bookmark_title', with: 'Hashtags!'
    fill_in 'bookmark_content', with: 'cool post! #hashtags #hashtaggable'
    click_on 'Save'
    expect(page).to have_content('#hashtags')
    expect(page).to have_content('#hashtaggable')
  end

  #scenario 'Hashtags is displayed with bookmarks categorized by Hashtag' do 
    #visit root_path
    #login(@user)
    #click_link 'Create Bookmark'
    #fill_in 'title', with: 'Hashtags!'
    #fill_in 'content', with: 'cool post! #hashtags #hashtaggable'
    #click_on 'Save'
    #Hashtag.should have_key(:bookmark)
  #end
 end 

