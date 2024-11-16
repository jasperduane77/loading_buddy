require 'loading_buddy'

LoadingBuddy.configure do |config|
  config.enabled = true
  config.min_size = 10
end

puts "LoadingBuddy Configuration:"
puts "Enabled: #{LoadingBuddy.configuration.enabled}"
puts "Minimum Size: #{LoadingBuddy.configuration.min_size}"
