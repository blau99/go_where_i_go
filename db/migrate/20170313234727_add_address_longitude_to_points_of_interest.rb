class AddAddressLongitudeToPointsOfInterest < ActiveRecord::Migration[5.0]
  def change
    add_column :points_of_interests, :address_longitude, :float
  end
end
