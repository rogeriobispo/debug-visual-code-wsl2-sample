class DogWalking < ApplicationRecord
  has_many :walking_pets
  has_many :pet, through: :walking_pets
end
