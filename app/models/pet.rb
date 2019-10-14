class Pet < ApplicationRecord
  belongs_to :person
  belongs_to :dog_walking
end
