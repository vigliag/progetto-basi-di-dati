require 'securerandom'

class Purchase < ActiveRecord::Base
	has_many :tickets
	
	def self.create_with_secret
		Purchase.new(secret: SecureRandom.hex(3))
	end

	def gen_secret
		@secret = SecureRandom.hex(3)
	end
end
