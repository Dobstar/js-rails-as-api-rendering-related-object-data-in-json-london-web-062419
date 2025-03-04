class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings.to_json(include: [:bird, :location])
    end

    def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
        render json: sighting.to_json(include: [:bird, :location])
    else
        render json: { message: 'No sighting found with that id' }
    end
    

    #def show
    #   sighting = Sighting.find_by(id: params[:id])
    #   render json: sighting.to_json(:include => {
    #     :bird => {:only => [:name, :species]},
    #     :location => {:only => [:latitude, :longitude]}
    #   }, :except => [:updated_at])
    # end
#the above method is also using the only and except method. This produces more specific data
end
