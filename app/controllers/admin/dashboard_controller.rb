class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def index
  	@shows = Show.includes(:movie)
  	.where(start: DateTime.now.beginning_of_day.. DateTime.now.end_of_day)
  	.select("shows.*, count(tickets.id) as ticket_count")
    .joins("left outer join tickets on tickets.show_id = shows.id")
    .group('shows.id')
  end

end
