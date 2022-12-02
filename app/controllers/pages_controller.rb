class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[home map]

  def home
    @markers = [
      {
        lat: current_user.latitude,
        lng: current_user.longitude
      }
    ]
  end

  def profile
    @user = User.find(params[:id])
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
