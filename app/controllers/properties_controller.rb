class PropertiesController < ApplicationController
    def index
        @properties = Property.all
    end

    def new
        @property = Property.new
        @property.stations.build
    end

    private
    def property_params
        params.require(:property).permit(:name, :rent, :address, :year, :remarks, stations_attributes: %i(id line name minute Property_id))
    end
    
end
