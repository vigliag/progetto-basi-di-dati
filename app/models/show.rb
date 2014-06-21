class Show < ActiveRecord::Base
	belongs_to :movie
	validates :movie_id, :start, :screen_id, :price, presence: true
end
