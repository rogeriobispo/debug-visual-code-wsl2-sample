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

  describe 'post #create' do
    pet1 = FactoryBot.create(:pet)
    pet2 = FactoryBot.create(:pet)
    walker = FactoryBot.create(:person)

    it 'when everything ok' do
      dog_walking_paylod = {
        "scheduled_date": Date.today,
        "duration": [30, 60].sample,
        "longitude": "484898.884",
        "latitude": "484898.884",
        "person_id": walker.id,
        "pets": [pet1.id, pet2.id]
      }
      post '/v1/dog_walking', params: dog_walking_paylod
      expect(response.status).to eq(200)
    end

    it 'when its missing mandatory fields' do
      dog_walking_playod = { }
      post '/v1/dog_walking', params: dog_walking_playod
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(parsed_response['person'].first).to eq('must exist')
      expect(parsed_response['duration'].first).to eq('duration must be 30 or 60')  
      expect(parsed_response['latitude'].first).to eq('can\'t be blank')
      expect(parsed_response['longitude'].first).to eq('can\'t be blank')
      expect(parsed_response['person_id'].first).to eq('can\'t be blank')
      expect(parsed_response['pets'].first).to eq('can\'t be blank')
      expect(parsed_response['scheduled_date'].first).to eq('can\'t be blank')
    end
  end

  describe 'patch #start_walking' do
    it 'when the walking is create' do
      walking = FactoryBot.create(:dog_walking, :created)
      patch "/v1/dog_walking/#{walking.id}/start_walking"
      walking.reload
      expect(response.status).to eq(200)
      expect(walking.status).to eq('started')
    end

    it 'when the walking is already started' do
      walking = FactoryBot.create(:dog_walking, :started)
      patch "/v1/dog_walking/#{walking.id}/start_walking"
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(parsed_response['status']).to eq('already started or finished')
    end

    it 'when the walking is already finished' do
      walking = FactoryBot.create(:dog_walking, :finished)
      patch "/v1/dog_walking/#{walking.id}/start_walking"
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(parsed_response['status']).to eq('already started or finished')
    end
  end

  
  describe 'patch #stop_walking' do
    it 'when the walking is create' do
      walking = FactoryBot.create(:dog_walking, :started)
      patch "/v1/dog_walking/#{walking.id}/stop_walking"
      walking.reload
      expect(response.status).to eq(200)
      expect(walking.status).to eq('finished')
    end

    it 'when the walking is already started' do
      walking = FactoryBot.create(:dog_walking, :created)
      patch "/v1/dog_walking/#{walking.id}/stop_walking"
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(parsed_response['status']).to eq('walking can\'t be finished it\'s not started')
    end

    it 'when the walking is already finshed' do
      walking = FactoryBot.create(:dog_walking, :finished)
      patch "/v1/dog_walking/#{walking.id}/stop_walking"
      parsed_response = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(parsed_response['status']).to eq('walking can\'t be finished it\'s not started')
    end
  end
end
