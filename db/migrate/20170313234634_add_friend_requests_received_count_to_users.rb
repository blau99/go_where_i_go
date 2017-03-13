class AddFriendRequestsReceivedCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :friend_requests_received_count, :integer
  end
end
