class Chatroom < ApplicationRecord
  has_many :messages
  has_one :user_friend
end
