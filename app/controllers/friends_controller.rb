class FriendsController < ApplicationController
  def find_friends
    @users = []

    if params[:query].present?
      @users += User.where("first_name ILIKE ?", "%#{params[:query]}%")
      @users += User.where(phone_number: params[:query])
    end
  end

  def create
    @friend = Friend.new(user_id: params[:user])
    @friend.save

    @user_friend = UserFriend.new(user_id: current_user.id, friend_id: @friend.id)
    @user_friend.save!

    redirect_to friends_path
  end

  def index
    @friends = Friend.all
  end




end
