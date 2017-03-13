class AddAddressLatitudeToPointsOfInterest < ActiveRecord::Migration[5.0]
  def change
    add_column :points_of_interests, :address_latitude, :float
  end
end
