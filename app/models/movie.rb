class Movie < ActiveRecord::Base
	has_many :shows, dependent: :destroy
	validates :title, :length, :year, :description, presence: true
	has_attached_file :poster
	validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/

	def dates
		all_dates = shows.group("date(start)").order(:start).map do |show|
			show.start.to_date
		end
	end

	def date_ranges
		a = dates
		prev = a[0]
		a.slice_before {|e|
		  prev, prev2 = e, prev
		  prev2 + 1.day != e
		}.map {|es|
		  es[0]..es[-1]
		}
	end

	def show_ranges
		all_shows = shows.group("date(start)").order(:start).map do |show|
			show.start
		end

		prev = all_shows[0].to_date
		all_shows.slice_before {|e|
		  e = e.to_date
		  prev, prev2 = e, prev
		  (prev2 != e) and (prev2 + 1.day != e)
		}.map {|es|
		  {start: es[0], end: es[-1] + length.minutes}
		}
	end

	#{:start=>Tue, 01 Jul 2014 05:30:01 UTC +00:00, :end=>Tue, 01 Jul 2014 06:56:01 UTC +00:00}

	def calendar_entries
		ary = show_ranges
		ary.map { |e|
			e[:title] = title
			e[:movie_id] = id
			e #in ruby è automaticamente ritornata l'ultima espressione del blocco 
		}
	end

	def next_show
		shows.order(:start).first
	end

	def self.in_next_days(ndays)
		where(id: Show.in_next_days(ndays).select(:movie_id).distinct)
	end
end
