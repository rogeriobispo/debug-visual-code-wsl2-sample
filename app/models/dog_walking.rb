class DogWalking < ApplicationRecord
  has_many :walking_pets
  has_and_belongs_to_many :pets
end
