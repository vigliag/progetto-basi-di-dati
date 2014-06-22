class Movie < ActiveRecord::Base
	has_many :shows, dependent: :destroy
	validates :title, :length, :year, :description, presence: true
	has_attached_file :poster
	validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/
end
