class AddAddressFormattedAddressToPointsOfInterest < ActiveRecord::Migration[5.0]
  def change
    add_column :points_of_interests, :address_formatted_address, :string
  end
end
