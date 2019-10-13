class CreateDogWalkings < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_walkings do |t|
      
      t.integer :status
      t.datetime :scheduled_date
      t.decimal :price
      t.time :duration
      t.string :latitude
      t.string :longitude
      t.timestamps :start_time
      t.timestamps :end_time

      t.timestamps
    end
  end
end
