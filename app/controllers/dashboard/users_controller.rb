class Dashboard::UsersController < Dashboard::DashboardController
  def index
    @users = User.includes(:owned_trips, :joined_trips)
  end
end
