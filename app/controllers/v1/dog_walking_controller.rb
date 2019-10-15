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
    render json: @walking.start!, status: :ok if @walking.created?
    render json: { 'status': 'alread started' }, status: :unprocessable_entity if @walking.started?
    render json: { 'status': 'alread finished' }, status: :unprocessable_entity if @walking.finished?
  end

  def stop_walking
    render json: @walking.finished!, status: :ok if @walking.started?
    render json: { 'status': 'already finished' }, status: :unprocessable_entity if @walking.finished?
    render json: { 'status': 'cant be finished' }, status: :unprocessable_entity if @walking.created?
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
