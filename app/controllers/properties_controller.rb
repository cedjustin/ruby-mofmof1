class PropertiesController < ApplicationController

    before_action :set_property, only: [:show, :edit, :update, :destroy]

    def index
        @properties = Property.all
    end

    def new
        @property = Property.new
        @property.stations.build
        @property.stations.build
    end

    def create
        @property = Property.new(property_params)
        if  @property.save
            Station.where("line=='' OR name=='' OR minutes IS NULL").each do |station|
                station.destroy
            end
            redirect_to  @property ,  notice: 'Property was successfully created.'
        else
            render  :new
        end
    end

    def show
    end

    def edit
        if @property.stations.last.minutes.blank? &&
            @property.stations.last.line.blank? &&
            @property.stations.last.name.blank?
        else
            @property.stations.build
        end
    end

    def update
        if  @property.update( property_params )
            redirect_to  @property ,  notice: 'Property was successfully updated.'
        else
            render  :edit
        end
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
