module LoadingBuddy
	class Configuration
		attr_accessor :enabled, :min_size, :title, :benchmark, :benchmark_prefix

		def initialize
			@enabled 	= true
			@min_size = 5
			@title   	= "Progress"
			@benchmark = false
			@benchmark_prefix = nil
		end
		
		def enabled?
			self.enabled
		end

		def benchmark?
			self.benchmark
		end
	end
end
