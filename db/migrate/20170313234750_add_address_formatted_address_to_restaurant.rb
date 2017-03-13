class AddAddressFormattedAddressToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :address_formatted_address, :string
  end
end
