class ActivitiesController < ApplicationController
    
    before_action :set_activity, only: [:show, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :display_error

    def index
        render json: Activity.all, status: :ok
    end

    def show 
        render json: @activity, status: :ok
    end

    def destroy 
        if @activity
            @activity.destroy
        else
            display_error
        end
        head :no_content
    end

    private

    def set_activity 
        @activity = Activity.find(params[:id])
    end

    def display_error error
        render json: {error: "Activity not found"}, status: 404
    end

end
