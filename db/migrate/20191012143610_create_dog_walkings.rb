class CreateDogWalkings < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_walkings do |t|
      t.references :person, foreign_key: true
      t.integer :status
      t.datetime :scheduled_date
      t.decimal :price
      t.time :duration
      t.string :latitude
      t.string :longitude
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
