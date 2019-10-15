class DogWalking < ApplicationRecord
  has_many :walking_pets
  has_and_belongs_to_many :pets
  belongs_to :person
  validates :duration, inclusion: { in: %w(30 60), message: "duration must be 30 or 60" }
  validates :longitude, :latitude, :person_id, :pets, :scheduled_date, :duration, presence: true
  enum status: [ :created, :started, :finished ]

end
