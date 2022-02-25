class EventsController < ApplicationController
    def index
        render json: Event.all
    end
    
    def show
        render json: Event.find(params[:id])
    end

    def create
        new_event = Event.create!(event_params)
        render json: new_event, status: :created
    end

    private
    
    def event_params
        params.permit(:name, :price, :stock, :description, :location, :date )
    end

end
