class PropertiesController < ApplicationController

    before_action :set_property, only: %i(show edit update destroy)

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
            redirect_to  property_path ,  notice: 'Property was successfully created.'
        else
            render  :new
        end
    end

    def show
    end

    private

    def set_property
        @property  = Property.find(params[:id])
    end

    def property_params
        params.require(:property).permit(:name, :rent, :address, :year, :remarks, stations_attributes: %i(id line name minutes Property_id))
    end
    
end
