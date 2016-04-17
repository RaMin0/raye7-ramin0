class Dashboard::TripsController < Dashboard::DashboardController
  def index
    @trips = Trip.includes(:user, :users)
  end
end
