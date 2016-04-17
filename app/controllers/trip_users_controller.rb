class TripUsersController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    trip.users << current_user
    redirect_to trips_path, notice: 'Joined trip successfully'
  end
  
  def destroy
    trip.users.destroy(current_user)
    redirect_to trips_path, notice: 'Left trip successfully'
  end
  
protected
  
  def trip
    @trip ||= Trip.find(params[:id])
  end
end
