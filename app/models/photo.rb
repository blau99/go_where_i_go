class Photo < ApplicationRecord
  # Direct associations

  belongs_to :restaurant

  belongs_to :accommodation

  belongs_to :point_of_interest,
             :class_name => "PointsOfInterest"

  belongs_to :user

  # Indirect associations

  # Validations

end
