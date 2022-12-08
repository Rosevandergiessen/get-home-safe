class Chatroom < ApplicationRecord
  has_many :messages
  has_many :user_friends
end
