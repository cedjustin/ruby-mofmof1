class PropertiesController < ApplicationController
    def index
        @properties = Property.all
    end

    def new
        @property = Property.new
        @property.stations.build
    end

    def create
        @property = Property.new(property_params)
        if  @property.save
            redirect_to  @property ,  notice: 'Property was successfully created.'
        else
            render  :new
        end
    end

    private
    def property_params
        params.require(:property).permit(:name, :rent, :address, :year, :remarks, stations_attributes: %i(id line name minute Property_id))
    end
    
end
