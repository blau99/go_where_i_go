class User < ApplicationRecord
  # Direct associations
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many   :restaurants,
  :dependent => :destroy

  has_many   :favorites,
  :dependent => :destroy

  has_many   :photos,
  :dependent => :destroy

  has_many   :points_of_interests,
  :dependent => :destroy

  has_many   :accommodations,
  :dependent => :destroy

  # Indirect associations

  has_many :friend_requests_where_sender, :class_name => "FriendRequest", :foreign_key => "sender_id", :dependent => :destroy
  has_many :friends_where_sender, :through => :friend_requests_where_sender, :source => :recipient

  has_many :friend_requests_where_recipient, :class_name => "FriendRequest", :foreign_key => "recipient_id", :dependent => :destroy
  has_many :friends_where_recipient, :through => :friend_requests_where_recipient, :source => :sender

  has_many :timeline_photos, :through => :friends_where_sender, :source => :accommodations

  validates :username, :presence => true, :uniqueness => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

end
