require 'rails_helper'
RSpec.describe Message, type: :model do
  context "With valid attributes" do 
    it "should save" do 
      expect(build(:message)).to be_valid
    end
  end
  context "With invalid attributes" do 
    it "should not save if message field is blank" do
      expect(build(:message, message: "")).to be_invalid
    end
    it "should not save if user field is blank" do
      expect(build(:message, user: nil)).to be_invalid
    end
  end
end