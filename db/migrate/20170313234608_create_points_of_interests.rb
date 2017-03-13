class CreatePointsOfInterests < ActiveRecord::Migration
  def change
    create_table :points_of_interests do |t|
      t.string :name
      t.string :address
      t.integer :admission_fee
      t.string :image
      t.integer :user_id

      t.timestamps

    end
  end
end
