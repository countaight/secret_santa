class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :password, on: :create
	belongs_to :receiver, class_name: 'User'

	def pick_receiver
		if !self.receiver
			self.receiver = potential_receivers.sample
			self.receiver.is_taken = true
			self.save
			self.receiver.save
		else
			self.receiver
		end
	end

	private

	def potential_receivers
		receivers_array = User.all
		receivers_minus_self = receivers_array.select { |user| user.name != self.name }
		receivers_minus_exception = receivers_minus_self.select { |user| user.name != self.exceptions }

		receivers_minus_exception
	end
end