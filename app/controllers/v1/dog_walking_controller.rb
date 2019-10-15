class V1::DogWalkingController < ApplicationController
  before_action :set_walking, only: [:show, :start_walking, :stop_walking]

  def index
    render json: DogWalkingService.list(params[:filter])
  end

  def show
    render json: @walking, status: :ok if @walking
  end

  def create
    walking = DogWalkingService.create_walking(dog_walking_params)
    if walking.save 
      render json: walking , status: :ok
    else 
      render json: walking.errors , status: :unprocessable_entity
    end
  end

  def start_walking
    if @walking.created?
      render json: @walking.started!, status: :ok
    else
      render json: { 'status': 'already started or finished' }, status: :unprocessable_entity
    end
  end

  def stop_walking
    if @walking.started?
      render json: @walking.finished!, status: :ok
    else
      render json: { 'status': 'walking can\'t be finished it\'s not started' }, status: :unprocessable_entity
    end
  end

  private 
  def set_walking
    begin
      @walking = DogWalking.find(params[:id])
    rescue
      render json: { 'Walking': 'not_found'}, status: :not_found
    end
  end

  def dog_walking_params
    params.permit(:scheduled_date,  
                          :duration, 
                          :latitude, 
                          :longitude,
                          :person_id,
                          pets: []
                        )
  end
end
