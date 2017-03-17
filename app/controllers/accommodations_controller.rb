class AccommodationsController < ApplicationController
  before_action :current_user_must_be_accommodation_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_accommodation_user
    accommodation = Accommodation.find(params[:id])

    unless current_user == accommodation.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Accommodation.ransack(params[:q])
    @accommodations = @q.result(:distinct => true).includes(:user, :photos, :favorites).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@accommodations.where.not(:address_latitude => nil)) do |accommodation, marker|
      marker.lat accommodation.address_latitude
      marker.lng accommodation.address_longitude
      marker.infowindow "<h5><a href='/accommodations/#{accommodation.id}'>#{accommodation.name}</a></h5><small>#{accommodation.address_formatted_address}</small>"
    end

    render("accommodations/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @photo = Photo.new
    @accommodation = Accommodation.find(params[:id])

    render("accommodations/show.html.erb")
  end

  def new
    @accommodation = Accommodation.new
    @photo = Photo.new

    render("accommodations/new.html.erb")
  end

  def create
    @accommodation = Accommodation.new
    @accommodation.name = params[:name]
    @accommodation.address = params[:address]
    @accommodation.image = params[:image]
    @accommodation.cost_per_night = params[:cost_per_night]
    @accommodation.user_id = params[:user_id]
    save_status = @accommodation.save

    @photo = Photo.new
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]
    @photo.accommodation_id = @accommodation.id
    @photo.save

    if save_status
      redirect_to "/photos", :notice => "Accommodation created successfully."
    else
      render 'new'
    end
  end

  def edit
    @accommodation = Accommodation.find(params[:id])

    render("accommodations/edit.html.erb")
  end

  def update
    @accommodation = Accommodation.find(params[:id])

    @accommodation.name = params[:name]
    @accommodation.address = params[:address]
    @accommodation.image = params[:image]
    @accommodation.cost_per_night = params[:cost_per_night]
    @accommodation.user_id = params[:user_id]

    if @accommodation.save
     redirect_to "/photos", :notice => "Accommodation updated successfully."
   else
     render 'edit'
   end
 end
  end

  def destroy
    @accommodation = Accommodation.find(params[:id])

    @accommodation.destroy

    if URI(request.referer).path == "/accommodations/#{@accommodation.id}"
      redirect_to("/", :notice => "Accommodation deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Accommodation deleted.")
    end
  end
end
