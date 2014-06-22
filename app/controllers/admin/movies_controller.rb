class Admin::MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout "admin"

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @shows = Show.select("shows.*, count(tickets.id) as ticket_count")
      .where(movie_id: @movie.id)
      .joins("left outer join tickets on tickets.show_id = shows.id")
      .group('shows.id')
    #@shows = @movie.shows
    @show = Show.new
    @show.movie_id = @movie.id
    #@new_show = @movie.shows.build()
  end

  def add_show
  
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to [:admin, @movie], notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @movie]}
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to [:admin, @movie], notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @movie] }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to admin_movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :length, :year, :description, :country, :poster)
    end
end
