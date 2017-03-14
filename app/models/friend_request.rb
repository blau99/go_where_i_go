class FriendRequest < ApplicationRecord
  belongs_to :sender, :class_name => "User", :foreign_key => "sender_id"

  belongs_to :recipient, :class_name => "User", :foreign_key => "recipient_id"

  validates :sender, :presence => true, :uniqueness => { :scope => :recipient }
  validates :recipient, :presence => true
end
