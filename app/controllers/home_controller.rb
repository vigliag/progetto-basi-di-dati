class HomeController < ApplicationController

  def index
    @screens = Screen.where(avaiable: true)
  end

  def movie_details
  	@movie = Movie.find(params[:id])
  end
end
