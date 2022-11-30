class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :home, :map ]

  def home
  end

  # def map
  #   @marker = {
  #     lat: current_user.latitude,
  #     lng: current_user.longitude
  #   }
  # end
end
