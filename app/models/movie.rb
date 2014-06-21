class Movie < ActiveRecord::Base
	has_many :shows, dependent: :destroy
	validates :title, :length, :year, :description, presence: true
end
