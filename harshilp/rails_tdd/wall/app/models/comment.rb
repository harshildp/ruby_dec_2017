class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  validates :comment, presence: true, length: {minimum: 6}
  validates :message, :user, presence: true
end
