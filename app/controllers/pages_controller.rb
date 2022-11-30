class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[home map]

  def home
  end

  def map
    @markers = [
      {
        lat: current_user.latitude,
        lng: current_user.longitude
      }
    ]
  end
end
