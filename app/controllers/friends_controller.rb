class FriendsController < ApplicationController
  def find_friends

  end

  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      redirect_to friends_path
    end
  end

  def index
    @friends = Friend.all
  end




  private

  def friend_params
    params.require(:friend).permit(:user_id, :name)
  end
end
