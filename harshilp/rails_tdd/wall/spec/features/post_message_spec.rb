require 'rails_helper'
feature "Message creates a new message" do
  before(:each) do 
    visit index_path
    fill_in 'user_username', with: "harshilp"
    click_button 'Sign In'    
  end
  scenario "successfully creates a new message" do
    fill_in "message_message", with: "My Test Message"
    click_button "Post Message"
    expect(page).to have_content "My Test Message"
    expect(page).to have_current_path(wall_path)    
  end
  scenario "successfully displays error messages if message field is left blank or invalid" do
    fill_in "message_message", with: ''
    click_button "Post Message"
    expect(page).to have_content "Message can't be blank"
    expect(page).to have_current_path(wall_path)
  end
end