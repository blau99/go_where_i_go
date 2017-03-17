class PointsOfInterestsController < ApplicationController
  # before_action :current_user_must_be_points_of_interest_user, :only => [:edit, :update, :destroy]
  #
  # def current_user_must_be_points_of_interest_user
  #   points_of_interest = PointsOfInterest.find(params[:id])
  #
  #   unless current_user == points_of_interest.user
  #     redirect_to :back, :alert => "You are not authorized for that."
  #   end
  # end

  def index
    @q = PointsOfInterest.ransack(params[:q])
    @points_of_interests = @q.result(:distinct => true).includes(:user, :photos, :favorites).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@points_of_interests.where.not(:address_latitude => nil)) do |points_of_interest, marker|
      marker.lat points_of_interest.address_latitude
      marker.lng points_of_interest.address_longitude
      marker.infowindow "<h5><a href='/points_of_interests/#{points_of_interest.id}'>#{points_of_interest.name}</a></h5><small>#{points_of_interest.address_formatted_address}</small>"

    end

    render("points_of_interests/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @photo = Photo.new
    @points_of_interest = PointsOfInterest.find(params[:id])

    render("points_of_interests/show.html.erb")
  end

  def new
    @points_of_interest = PointsOfInterest.new
    @photo = Photo.new

    render("points_of_interests/new.html.erb")
  end

  def create
    @points_of_interest = PointsOfInterest.new
    @points_of_interest.name = params[:name]
    @points_of_interest.address = params[:address]
    @points_of_interest.admission_fee = params[:admission_fee]
    @points_of_interest.image = params[:image]
    @points_of_interest.user_id = current_user.id
    save_status = @points_of_interest.save

    @photo = Photo.new
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]
    @photo.point_of_interest_id = @points_of_interest.id
    @photo.save

    if save_status
      redirect_to "/photos", :notice => "Point of Interest created successfully."
    else
      render 'new'
    end
  end

  def edit
    @points_of_interest = PointsOfInterest.find(params[:id])

    render("points_of_interests/edit.html.erb")
  end

  def update
    @points_of_interest = PointsOfInterest.find(params[:id])

    @points_of_interest.name = params[:name]
    @points_of_interest.address = params[:address]
    @points_of_interest.admission_fee = params[:admission_fee]
    @points_of_interest.image = params[:image]
    @points_of_interest.user_id = current_user.id


    if @points_of_interest.save
      redirect_to "/photos", :notice => "Point of Interest updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @points_of_interest = PointsOfInterest.find(params[:id])

    @points_of_interest.destroy

    if URI(request.referer).path == "/points_of_interests/#{@points_of_interest.id}"
      redirect_to("/", :notice => "Points of interest deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Points of interest deleted.")
    end
  end
end
