class PointsOfInterest < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :foreign_key => "point_of_interest_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
