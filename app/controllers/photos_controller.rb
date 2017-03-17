class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    @friend_request = FriendRequest.all
  end

  def show
    @photo = Photo.find(params[:id])
    @friend_request = FriendRequest.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]

    if @photo.save
      redirect_to "/photos/#{@photo.id}", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy

    redirect_to "/photos", :notice => "Photo deleted."
  end

  def my_wall
    @photos = Photo.all

    render 'my_wall'
  end
end
