class Restaurant < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :favorites,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  has_many   :best_dishes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
