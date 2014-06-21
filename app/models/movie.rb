class Movie < ActiveRecord::Base
	has_many :shows
	validates :title, :length, :year, :description, presence: true
end
