require 'spec_helper'

feature 'User Authentication', %q{
  As the user of the site
  I want to be able to log in
  So I can access my content
} do

  background do
    @user = create(:user)
  end

  scenario 'User visits site and logs in successfully' do
    visit root_path
    click_link_or_button 'Sign In'
    fill_in 'Email', with: @user.email 
    fill_in 'Password', with: @user.password
    click_link_or_button 'Sign in'
    expect(page).to have_content("Hello #{@user.email}!")
  end

end
