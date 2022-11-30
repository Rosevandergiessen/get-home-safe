class AddChatroomToUserFriend < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_friends, :chatroom, foreign_key: true
  end
end
