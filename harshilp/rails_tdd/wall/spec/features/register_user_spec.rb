require 'rails_helper'
feature "User creates an account" do
  before(:each) do 
    visit index_path
  end
  scenario "successfully creates a new user account" do
    fill_in "user_username", with: "harshilp"
    click_button "Sign In"
    expect(page).to have_content "Welcome, harshilp"
    expect(page).to have_current_path(wall_path)    
  end
  scenario "successfully displays error messages if username field is left blank or invalid" do
    fill_in "user_username", with: ''
    click_button "Sign In"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_current_path(index_path)
  end
end