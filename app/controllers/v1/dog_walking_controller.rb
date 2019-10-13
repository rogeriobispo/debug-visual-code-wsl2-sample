class V1::DogWalkingController < ApplicationController

  def index

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
  def set_person
    @walking = DogWalking.find(params[:id]);
  end
end
