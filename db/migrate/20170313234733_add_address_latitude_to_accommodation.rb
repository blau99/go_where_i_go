class AddAddressLatitudeToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :address_latitude, :float
  end
end
