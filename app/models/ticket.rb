class Ticket < ActiveRecord::Base
	belongs_to :purchase
	belongs_to :show
end
