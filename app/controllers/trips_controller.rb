class TripsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @upcoming_trips = Trip.upcoming.includes(:user, :users)
    @joined_trips = current_user.joined_trips.includes(:user, :users)
    @owned_trips = current_user.owned_trips
  end
  
  def new
    @trip = current_user.owned_trips.build
  end
  
  def create
    @trip = current_user.owned_trips.build(trip_params)
    
    if @trip.save
      redirect_to trips_path, notice: 'Trip added successfully'
    else
      render action: :new
    end
  end
  
protected
  
  def trip_params
    params.require(:trip).permit \
      :begins_at,
      :source_address, :source_latitude, :source_longitude,
      :destination_address, :destination_latitude, :destination_longitude
  end
end
