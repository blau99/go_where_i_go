class AddPriceRangeToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :price_range, :string
  end
end
