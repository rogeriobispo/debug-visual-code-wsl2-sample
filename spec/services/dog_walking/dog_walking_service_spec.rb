require 'rails_helper'

RSpec.describe DogWalkingService, type: :service do
  create(:dog_walking_future)
  create(:dog_walking_past)
  create(:dog_walking_today)
  create(:dog_walking_future)
  create(:dog_walking_past)
  create(:dog_walking_today)
end