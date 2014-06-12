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

  private
  def flight_params
    params.require(:flight).permit(:airline, :destination)
  end

end