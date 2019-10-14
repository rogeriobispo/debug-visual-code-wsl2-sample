class V1::DogWalkingController < ApplicationController
  before_action :set_walking, only[:show, :start_walking, :stop_walking]

  def index
    render json: DogWalkingService.list(params[:filter])
  end

  def show
    if @walking
      render json: @walking, status: :ok
    else
      render json: {'not_found': 'Walking não localizada'}, status: :not_found
    end 
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
    @walking = DogWalking.find(params[:id]);
  end
end
