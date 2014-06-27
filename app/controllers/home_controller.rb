class HomeController < ApplicationController

  def index
    @screens = Screen.where(avaiable: true)
  end

  def movie_details
  	@movie = Movie.find(params[:id])
  end

  def movie_calendar
  	@movies = Movie.all
  	@entries = []
  	@movies.each do |movie|
  		@entries += movie.calendar_entries
  	end
  end
end
