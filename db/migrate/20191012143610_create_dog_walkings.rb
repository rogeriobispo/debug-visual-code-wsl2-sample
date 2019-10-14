class CreateDogWalkings < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_walkings do |t|
      
      t.integer :status
      t.references :person
      t.datetime :scheduled_date
      t.decimal :price
      t.string :duration
      t.string :latitude
      t.string :longitude
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
