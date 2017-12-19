require 'rails_helper'
feature "Comment creates a new comment" do
  before(:each) do 
    visit index_path
    fill_in 'user_username', with: "harshilp"
    click_button 'Sign In'
    fill_in 'message_message', with: 'My Test Message' 
    click_button 'Post Message'
  end
  scenario "successfully creates a new comment" do
    fill_in "comment_comment", with: "My Test Comment"
    click_button "Comment"
    expect(page).to have_content "My Test Comment"
    expect(page).to have_current_path(wall_path)    
  end
  scenario "successfully displays error messages if comment field is left blank or invalid" do
    fill_in "comment_comment", with: ''
    click_button "Comment"
    expect(page).to have_content "Comment can't be blank"
    expect(page).to have_current_path(wall_path)
  end
end