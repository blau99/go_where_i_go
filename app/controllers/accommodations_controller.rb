class AccommodationsController < ApplicationController
  before_action :current_user_must_be_accommodation_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_accommodation_user
    accommodation = Accommodation.find(params[:id])

    unless current_user == accommodation.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @accommodations = Accommodation.all
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

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accommodations/new", "/create_accommodation"
        redirect_to("/accommodations")
      else
        redirect_back(:fallback_location => "/", :notice => "Accommodation created successfully.")
      end
    else
      render("accommodations/new.html.erb")
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

    save_status = @accommodation.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accommodations/#{@accommodation.id}/edit", "/update_accommodation"
        redirect_to("/accommodations/#{@accommodation.id}", :notice => "Accommodation updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Accommodation updated successfully.")
      end
    else
      render("accommodations/edit.html.erb")
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
