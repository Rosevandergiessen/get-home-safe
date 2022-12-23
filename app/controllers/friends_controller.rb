class FriendsController < ApplicationController
  def find_friends
    @users = []

    if params[:query].present?
      # @users += User.where("first_name ILIKE ?", "%#{params[:query]}%")
      @users += User.where(phone_number: params[:query])
    end
  end

  def create
    # create 'friendship' between current user and selected user
    @friend_me = Friend.find_by(user_id: current_user.id)
    @friend_me = Friend.create(user_id: current_user.id) unless @friend_me

    @friend = Friend.find_by(user_id: params[:user])
    @friend = Friend.create(user_id: params[:user]) unless @friend
    # @friend.save

    # create chatroom for every new friend - subscription controller/channel

    @chatroom = Chatroom.create

    # join table in schema - creates 'userfriend' relationship
    @user_friend_me = UserFriend.new(user_id: params[:user], friend_id: @friend_me.id, chatroom_id: @chatroom.id)

    @user_friend = UserFriend.new(user_id: current_user.id, friend_id: @friend.id, chatroom_id: @chatroom.id)

    # if userfriend/friendship is successfully created:
    if @user_friend.save && @user_friend_me.save
      redirect_to friends_path
    else
      render "public/404.html"
    end
  end

  def index
    @friends = []
    @friends += UserFriend.where(user: current_user)
    # friend = Friend.where(user_id: current_user.id).first
    # @friends += UserFriend.where(friend: friend)
  end


end
