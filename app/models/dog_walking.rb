class DogWalking < ApplicationRecord
  belongs_to :person
  has_many :pets
  has_many :pets, through: :walking_pets
end
