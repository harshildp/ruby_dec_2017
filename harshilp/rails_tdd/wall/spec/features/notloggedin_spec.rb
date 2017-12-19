require 'rails_helper'
feature "User" do
  scenario 'auto redirects to index if user not in session' do
    visit wall_path
    expect(page).to have_content('Sign In')
    expect(page).to have_current_path(index_path)
  end
end