require 'rails_helper'
RSpec.describe Comment, type: :model do
  context "With valid attributes" do 
    it "should save" do
      create(:message)
      expect(build(:comment, message: Message.first, user: User.first)).to be_valid
    end
  end
  context "With invalid attributes" do 
    it "should not save if comment field is blank" do
      expect(build(:comment, comment: "")).to be_invalid
    end
  end
end
