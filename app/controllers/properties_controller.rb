class PropertiesController < ApplicationController

    before_action :set_property, only: [:show, :edit, :update, :destroy]

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

    def show
    end

    def edit
    end

    def destroy
        @property.destroy
        redirect_to properties_path, notice:"property destroyed"
    end

    private

    def set_property
        @property  = Property.find(params[:id])
    end

    def property_params
        params.require(:property).permit(:name, :rent, :address, :year, :remarks, stations_attributes: [:id, :line, :name, :minutes, :Property_id])
    end
    
end
