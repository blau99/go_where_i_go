class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :photos,
             :dependent => :destroy

  has_many   :best_dishes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
