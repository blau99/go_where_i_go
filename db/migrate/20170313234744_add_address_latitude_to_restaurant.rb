class AddAddressLatitudeToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :address_latitude, :float
  end
end
