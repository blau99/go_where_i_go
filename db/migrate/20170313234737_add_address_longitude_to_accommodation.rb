class AddAddressLongitudeToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :address_longitude, :float
  end
end
