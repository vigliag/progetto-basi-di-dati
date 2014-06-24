class Screen < ActiveRecord::Base
	has_many :shows

	def seats
		read_attribute(:seats_string).split(" ")
	end

	def seats=(seats_array)
		write_attribute(:seats_string, seats_array.join(" "))
	end

	def first_show
		shows().where("start >= :data", {data: DateTime.now}).order(start: :asc).first
	end
end
