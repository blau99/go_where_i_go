class PointsOfInterest < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :favorites,
             :foreign_key => "point_of_interest_id",
             :dependent => :destroy

  has_many   :photos,
             :foreign_key => "point_of_interest_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
