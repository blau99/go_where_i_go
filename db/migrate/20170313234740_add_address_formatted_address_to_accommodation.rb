class AddAddressFormattedAddressToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :address_formatted_address, :string
  end
end
