module LoadingBuddy
	class Configuration
		attr_accessor :enabled, :min_size, :title

		def initialize
			@enabled 	= true
			@min_size = 5
			@title   	= "Progress"
		end
	end
end
