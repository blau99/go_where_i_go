class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :price_range
      t.string :image
      t.integer :user_id

      t.timestamps

    end
  end
end
