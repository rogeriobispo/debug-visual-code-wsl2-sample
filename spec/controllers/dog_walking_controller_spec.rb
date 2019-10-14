require 'rails_helper'

RSpec.describe V1::DogWalkingController, type: :request do

  describe 'get #index' do
    it 'when there is no walking to return without filter' do
      get '/v1/dog_walking'
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(parsed_response.count).to eq(0)
      expect(parsed_response.class).to be(Array)
    end

    it 'when there is no walking to return with filter 1' do
      get '/v1/dog_walking?filter=1'
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(parsed_response.count).to eq(0)
      expect(parsed_response.class).to be(Array)
    end


    it 'when there is no walking to return with filter 2' do
      get '/v1/dog_walking?filter=2'
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(parsed_response.count).to eq(0)
      expect(parsed_response.class).to be(Array)
    end


    it 'when has walking to return without filter' do

      FactoryBot.create(:dog_walking, :min60future)
      FactoryBot.create(:dog_walking, :min30future)
      FactoryBot.create(:dog_walking)

      FactoryBot.create(:dog_walking, :min30past)
      FactoryBot.create(:dog_walking, :min60past)

      get '/v1/dog_walking'
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(parsed_response.count).to eq(5)
      expect(parsed_response.class).to be(Array)
    end

    it 'when there is no walking to return with filter 1' do

      FactoryBot.create(:dog_walking, :min60future)
      FactoryBot.create(:dog_walking, :min30future)
      FactoryBot.create(:dog_walking)

      FactoryBot.create(:dog_walking, :min30past)
      FactoryBot.create(:dog_walking, :min60past)
      get '/v1/dog_walking?filter=1'
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(parsed_response.count).to eq(2)
      expect(parsed_response.class).to be(Array)
    end


    it 'when there is no walking to return with filter 2' do

      FactoryBot.create(:dog_walking, :min60future)
      FactoryBot.create(:dog_walking, :min30future)
      FactoryBot.create(:dog_walking)

      FactoryBot.create(:dog_walking, :min30past)
      FactoryBot.create(:dog_walking, :min60past)

      get '/v1/dog_walking?filter=2'
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(parsed_response.count).to eq(5)
      expect(parsed_response.class).to be(Array)
    end
  end

  describe 'get #show' do
    it 'when the dog walking does not exists' do
      get '/v1/dog_walking/10'
      expect(response.status).to eq(404)
    end

    it 'when the  do walking exists' do
      dg = FactoryBot.create(:dog_walking)
      get "/v1/dog_walking/#{dg.id}"
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(parsed_response.class).to be(Hash)
      expect(parsed_response['status']).to eq(dg.status)
    end
  end
end
