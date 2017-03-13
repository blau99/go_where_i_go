class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :address
      t.string :image
      t.integer :cost_per_night
      t.integer :user_id

      t.timestamps

    end
  end
end
