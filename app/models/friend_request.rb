class FriendRequest < ApplicationRecord
  # Direct associations

  belongs_to :recipient,
             :class_name => "User",
             :counter_cache => :friend_requests_received_count

  belongs_to :sender,
             :class_name => "User",
             :counter_cache => :friend_requests_sent_count

  # Indirect associations

  # Validations

end
