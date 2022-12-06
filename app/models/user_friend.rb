class UserFriend < ApplicationRecord
  belongs_to :user
  belongs_to :friend
  belongs_to :chatroom

  validates :user, uniqueness: { scope: :friend }
end
