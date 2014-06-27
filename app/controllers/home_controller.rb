class HomeController < ApplicationController

  def index
    #@screens = Screen.where(avaiable: true)
    @movies = Movie.in_next_days(3).take(4)
  end

  def movie_details
  	@movie = Movie.find(params[:id])
  	@shows = @movie.shows.order(:start).where(start: DateTime.now.. (DateTime.now + 1.week))
  end

  def movie_calendar
  	@movies = Movie.all
  	@entries = []
  	@movies.each do |movie|
  		@entries += movie.calendar_entries
  	end
  end

  def buy_tickets
  	@show = Show.find(params[:show_id])
  	@tickets = @show.tickets.includes(:purchase)
  end

  def purchase
  	
	@show = Show.find(params[:show_id])
	@seats = params[:seats]

	@purchase = Purchase.new(name: params[:name])
	@purchase.gen_secret!
	@purchase.save!

	@tickets = []
	@seats.each do |seat|
		@tickets << Ticket.create(show_id: @show.id , seat: seat, purchase_id: @purchase.id)
	end

	render :ticket
  end

  def contacts
  	
  end
end
