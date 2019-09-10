class SightingsController < ApplicationController
    def index 
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

    def show 
        # when you've got connections ... use include to send this info to JS
        sighting = Sighting.find_by(id: params[:id])
        if(sighting)
            render json: sighting, include: [:bird, :location], except: [:updated_at]
        else
            render json: {message: 'No sighting found with that id'}
        end
    end
end
