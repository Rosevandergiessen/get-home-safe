class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[home map]

  def home
    @markers = [
      {
        lat: 52.377956,
        lng: 4.897070
      }
    ]
  end

  def profile
    @user = User.find(params[:id])

  end

  def activate
    session[:status] = true
  end

  def deactivate
    session[:status] = false
  end

  def unfriend
    @user_friend = UserFriend.find(params[:id])
    @user_friend.destroy
    redirect_to friends_path
  end

  def map
    @markers = [
      {
        lat: current_user.latitude,
        lng: current_user.longitude
      }
    ]
  end

  def send_location
    LocationChannel.broadcast_to(
      "GHS",
      render_to_string(partial: "pages/cords", locals: { lng: params[:lng], lat: params[:lat] })
    )
    head :ok
  end



end
