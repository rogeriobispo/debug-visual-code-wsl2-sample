require 'rails_helper'

RSpec.describe DogWalkingService, type: :service do
  before(:each) do
    FactoryBot.create(:dog_walking, :min60future)
    FactoryBot.create(:dog_walking, :min30future)
    FactoryBot.create(:dog_walking)

    FactoryBot.create(:dog_walking, :min30past)
    FactoryBot.create(:dog_walking, :min60past)

    FactoryBot.create(:dog_walking)
    FactoryBot.create(:price, :duration30)
    FactoryBot.create(:price, :duration60)
  end
  
  describe '.list' do

    it('filter 1') do
      expect(DogWalkingService.list(1).count).to eq(3)
    end
    it('filter 2') do
      expect(DogWalkingService.list(2).count).to eq(6)
    end
  end

  describe ".price_calculate" do
    it('duration 30') do
      pets = []
      duration = 30
      expect(DogWalkingService.price_calculate(duration, pets).to_f).to eq(0.0)
    end

    it('duration 30 one pet') do
      pets = [1]
      duration = 30
      expect(DogWalkingService.price_calculate(duration, pets).to_f).to eq(25.0)
    end

    it('duration 30 two pet') do
      pets = [1, 2]
      duration = 30
      expect(DogWalkingService.price_calculate(duration, pets).to_f).to eq(40.0)
    end

    it('duration 30 three pet') do
      pets = [1, 2, 3]
      duration = 30
      expect(DogWalkingService.price_calculate(duration, pets).to_f).to eq(55.0)
    end

    it('duration 60') do
      pets = []
      duration = 60
      expect(DogWalkingService.price_calculate(duration, pets).to_f).to eq(0.0)
    end

    it('duration 60 one pet') do
      pets = [1]
      duration = 60
      expect(DogWalkingService.price_calculate(duration, pets).to_f).to eq(35.0)
    end

    it('duration 60 two pet') do
      pets = [1, 2]
      duration = 60
      expect(DogWalkingService.price_calculate(duration, pets).to_f).to eq(55.0)
    end

    it('duration 60 three pet') do
      pets = [1, 2, 3]
      duration = 60
      expect(DogWalkingService.price_calculate(duration, pets).to_f).to eq(75.0)
    end
  end

  describe ".create_walking" do
    it 'must return instance of dogwalking' do
      dg = DogWalkingService.create_walking({duration: '30'})
      expect(dg.instance_of?(DogWalking)).to be(true)
    end
  end
end
