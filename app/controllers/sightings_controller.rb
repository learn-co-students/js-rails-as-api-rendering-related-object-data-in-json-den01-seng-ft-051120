class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird,:location]
    end

    def show 
        sighting = Sighting.find_by(id: params[:id])

        if sighting
            render json: sighting, :include => {
                :bird => {:only => [:name, :species]},
                :location => {:only => [:latitude, :longitude]}
              }, :except => [:updated_at]
        else
            render json: {message: 'Nosighting found'}
        end
    end
end
