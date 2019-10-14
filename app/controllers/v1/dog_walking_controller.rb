class V1::DogWalkingController < ApplicationController
  before_action :set_walking, only: [:show, :start_walking, :stop_walking]

  def index
    render json: DogWalkingService.list(params[:filter])
  end

  def show
    render json: @walking, status: :ok if @walking
  end

  def create
    render json: { "lista": 'walking' }, status: :ok
  end

  def start_walking
    render json: { "lista": 'walking' }, status: :ok
  end

  def stop_walking
    render json: { "lista": 'walking' }, status: :ok
  end

  private 
  def set_walking
    begin
      @walking = DogWalking.find(params[:id])
    rescue
      render json: { 'message': 'not_found'}, status: :not_found
    end
  end
end
