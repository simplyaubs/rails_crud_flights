class FlightsController < ApplicationController

  def index
    @flight = Flight.new
    @flights = Flight.all
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save

      redirect_to flights_path
    else
      render :index
    end
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])
    @flight.update_attributes!(flight_params)

    redirect_to flights_path
  end

  def destroy
    @flight = Flight.find(params[:id]).delete

    redirect_to flights_path
  end

  private
  def flight_params
    params.require(:flight).permit(:airline, :destination)
  end

end