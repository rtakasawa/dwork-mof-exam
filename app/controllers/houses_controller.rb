class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  def index
    @houses = House.order("id")
  end

  def show
  end

  def new
    @house = House.new
    Station::STATION_FORMAT.times {@house.stations.build}
  end

  def edit
    @house.stations.build
  end

  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        display_of_station_field
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @house.update(update_house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        display_of_station_field
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @house.destroy
    @house.stations.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def display_of_station_field
    if @house.stations.to_a.count == 0
      Station::STATION_FORMAT.times { @house.stations.build }
    end

    if @house.stations.to_a.count == 1 || @house.stations.to_a.count > 1
      @house.stations.build
    end
  end

    def set_house
      @house = House.find(params[:id])
    end


    def house_params
      params.require(:house).permit(:house_name, :rent, :house_address, :house_age, :remarks,
                                    stations_attributes: [:line, :station_name, :minutes_on_foot])
    end

    def update_house_params
      params.require(:house).permit(:house_name, :rent, :house_address, :house_age, :remarks,
                                    stations_attributes: [:line, :station_name, :minutes_on_foot, :minutes_on_foot, :_destroy, :id])
    end
end
