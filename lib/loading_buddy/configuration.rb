module LoadingBuddy
	class Configuration
		attr_accessor :enabled, :min_size

		def initialize
			@enabled = true
			@min_size = 5
		end
	end
end
