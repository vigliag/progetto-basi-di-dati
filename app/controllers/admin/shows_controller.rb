class Admin::ShowsController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"

  def create
    @show = Show.new(shows_params)
    @show.movie_id = params[:movie_id]
    respond_to do |format|
      if @show.save
        format.html { redirect_to [:admin, @show.movie], notice: 'Show was successfully added' }
        format.json { render :show, status: :created, location: [:admin, @movie]}
      else
        format.html { redirect_to [:admin, @show.movie]}
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def shows_params
      params.require(:show).permit(:movie_id, :start, :price, :screen_id)
   end
end
