class Favorite < ApplicationRecord
  # Direct associations

  belongs_to :accommodation

  belongs_to :point_of_interest,
             :class_name => "PointsOfInterest"

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
