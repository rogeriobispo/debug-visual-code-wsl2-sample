require 'rails_helper'

RSpec.describe DogWalkingService, type: :service do
  before(:each) do
    FactoryBot.create(:dog_walking, :min60future)
    FactoryBot.create(:dog_walking, :min30future)
    FactoryBot.create(:dog_walking)

    FactoryBot.create(:dog_walking, :min30past)
    FactoryBot.create(:dog_walking, :min60past)



    FactoryBot.create(:dog_walking)
  end
  describe '.list' do

    it('filter 1') do
      expect(DogWalkingService.list(1).count).to eq(3)
    end
    it('filter 2') do
      expect(DogWalkingService.list(2).count).to eq(6)
    end

  end
end