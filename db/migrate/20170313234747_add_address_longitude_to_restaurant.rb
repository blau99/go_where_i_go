class AddAddressLongitudeToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :address_longitude, :float
  end
end
