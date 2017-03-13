class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :restaurant_id
      t.integer :accommodation_id
      t.integer :point_of_interest_id
      t.integer :user_id
      t.text :caption

      t.timestamps

    end
  end
end
