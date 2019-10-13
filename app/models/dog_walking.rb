class DogWalking < ApplicationRecord
  has_many :pets
  has_many :pets, through: :walking_pets
end
