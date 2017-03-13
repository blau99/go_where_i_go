class User < ApplicationRecord
  # Direct associations

  has_many   :friend_requests_received,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :friend_requests_sent,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

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

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
