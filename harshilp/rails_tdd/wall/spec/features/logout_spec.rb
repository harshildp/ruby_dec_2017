require 'rails_helper'
feature "User" do
  before(:each) do 
    visit index_path
    fill_in 'user_username', with: "harshilp"
    click_button 'Sign In'
  end
  scenario 'logs out of account in session' do
    click_on 'Log Out'
    expect(page).to have_content('Sign In')
    expect(page).to have_current_path(index_path)
  end
end