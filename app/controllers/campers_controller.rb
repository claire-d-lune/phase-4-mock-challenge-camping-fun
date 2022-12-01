class CampersController < ApplicationController

    before_action :set_camper, only: [:show, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :display_not_found


    def index
        render json: Camper.all, except: [:activities], status: :ok
    end

    def show 
        render json: @camper, status: :ok
    end

    def create 
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def set_camper 
        @camper = Camper.find(params[:id])
    end

    def camper_params 
        params.permit(:name, :age)
    end

    def display_not_found error 
        render json: {error: "Camper not found"}, status: 404
    end

end
