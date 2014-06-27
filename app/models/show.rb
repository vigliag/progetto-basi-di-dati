class Show < ActiveRecord::Base
	belongs_to :movie
	belongs_to :screen
	has_many :tickets
	validates :movie_id, :start, :screen_id, :price, presence: true
	validates :price, numericality: true

	delegate :seats, to: :screen
	
	def taken_seats
		tickets.map do |i|
			i.seat
		end
	end

	def avaiable_seats
		seats - taken_seats
	end

	def self.in_next_days(ndays)
		where(start: DateTime.now.beginning_of_day.. (DateTime.now.end_of_day + ndays.days))
			.order(:start)
	end
end
