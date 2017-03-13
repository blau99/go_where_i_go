class Accommodation < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
