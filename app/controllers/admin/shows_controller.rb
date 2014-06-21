class Admin::ShowsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  layout "admin"

  def show
    @tickets = @show.tickets.includes(:purchase)
  end

  def create
    @show = Show.new(shows_params)
    @show.movie_id = params[:movie_id]
    respond_to do |format|
      if @show.save
        format.html { redirect_to [:admin, @show.movie], notice: 'Show was successfully added' }
        format.json { render :show, status: :created, location: [:admin, @show.movie]}
      else
        flash['error'] = 'There was a problem creating show'
        format.html { redirect_to [:admin, @show.movie]}
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @movie = Movie.find(@show.movie_id) #todo, pessimo
  end

  def destroy
    #TODO controllare se ci sono ticket, in caso impedire cancellazione
    @movie_id = @show.movie_id
    @show.destroy
    respond_to do |format|
      flash['success'] = 'Show cancelled' 
      format.html { redirect_to admin_movie_url @movie_id}
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @show.update(shows_params)
        format.html { redirect_to [:admin, @show.movie], notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @show.movie] }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  def shows_params
      params.require(:show).permit(:movie_id, :start, :price, :screen_id)
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end
end
