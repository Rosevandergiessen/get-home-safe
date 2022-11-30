class UserFriend < ApplicationRecord
  belongs_to :user
  belongs_to :friend
  belongs_to :chatroom
end
