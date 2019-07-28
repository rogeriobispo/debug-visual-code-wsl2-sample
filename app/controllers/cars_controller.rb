
    class CarsController < ApplicationController
        def show
           render json: {"sucesso": "sucesso baby"}, status: :ok
        end
    end     
