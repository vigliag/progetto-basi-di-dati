class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"
  def index
  end

  def shows_params
      params.require(:show).permit(:movie_id, :start, :price, :screen_id)
    end
end
