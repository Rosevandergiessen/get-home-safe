class PagesController < ApplicationController
  before_action :authenticate_user!, only: %i[home map]

  def home
    @locations = Location.where(category: "Police station")

    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: location }),
        image_url: helpers.asset_url("police_icon.png")
      }
    end

    @hospitals = Location.where(category: "Hospital")
    @markers += @hospitals.geocoded.map do |hospital|
      {
        lat: hospital.latitude,
        lng: hospital.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: hospital }),
        image_url: helpers.asset_url("hospital_marker.png")
      }
    end


    @areas = Location.where(category: "Busy area")
    @markers += @areas.geocoded.map do |area|
      {
        lat: area.latitude,
        lng: area.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: area }),
        image_url: helpers.asset_url("busy_area.png")
      }
    end

    ids = current_user.friends.pluck(:user_id)
    friends = User.where(id: ids)
    @markers += friends.geocoded.map do |f|
      {
        lat: f.latitude,
        lng: f.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: f }),
        image_url: helpers.asset_url("friend_house.png")
      }
    end

    @markers += [
      {
        lat: current_user.latitude,
        lng: current_user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: current_user }),
        image_url: helpers.asset_url("home_marker.png")
      }
    ]

    @markers += [
      {
        lat: 0,
        lng: 0
      }
    ]
  end

  def profile
    @user = User.find(params[:id])
  end

  def map
    @locations = Location.where(category: "Police station")

    @markers = @locations.geocoded.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: location }),
        image_url: helpers.asset_url("police_icon.png")
      }
    end

    @hospitals = Location.where(category: "Hospital")
    @markers += @hospitals.geocoded.map do |hospital|
      {
        lat: hospital.latitude,
        lng: hospital.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: hospital }),
        image_url: helpers.asset_url("hospital_marker.png")
      }
    end


    @areas = Location.where(category: "Busy area")
    @markers += @areas.geocoded.map do |area|
      {
        lat: area.latitude,
        lng: area.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: area }),
        image_url: helpers.asset_url("busy_area.png")
      }
    end

    ids = current_user.friends.pluck(:user_id)
    friends = User.where(id: ids)
    @markers += friends.geocoded.map do |f|
      {
        lat: f.latitude,
        lng: f.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: f }),
        image_url: helpers.asset_url("friend_house.png")
      }
    end

    @markers += [
      {
        lat: current_user.latitude,
        lng: current_user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { marker: current_user }),
        image_url: helpers.asset_url("home_marker")
      }
    ]

    @markers += [
      {
        lat: 0,
        lng: 0
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

  # def profile
  #   @user = User.find(params[:id])
  # end

  def activate
    session[:status] = true
  end

  def deactivate
    session[:status] = false
  end

  def unfriend
    @user_friend = UserFriend.find(params[:id])
    @user_friend.destroy
    redirect_to friends_path, status: :see_other
  end
end
