class FriendRequestsController < ApplicationController
  def index
    @friend_requests = FriendRequest.all
  end

  def show
    @friend_request = FriendRequest.find(params[:id])
  end

  def new
    @friend_request = FriendRequest.new
  end

  def create
    @friend_request = FriendRequest.new
    @friend_request.sender_id = current_user.id
    @friend_request.recipient_id = params[:recipient_id]

    if @friend_request.save
      redirect_to :back, :notice => "Friend request created successfully."
    else
      render 'new'
    end
  end

  def edit
    @friend_request = FriendRequest.find(params[:id])
  end

  def update
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.sender_id = current_user.id
    @friend_request.recipient_id = params[:recipient_id]

    if @friend_request.save
      redirect_to "/friend_requests", :notice => "Friend request updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.destroy

    redirect_to :back, :notice => "Friend request deleted."
  end
end
