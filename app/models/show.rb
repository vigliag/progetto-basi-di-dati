class Show < ActiveRecord::Base
	belongs_to :movie
	has_many :tickets
	validates :movie_id, :start, :screen_id, :price, presence: true
	validates :price, numericality: true
end
