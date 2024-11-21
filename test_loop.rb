require "loading_buddy"

LoadingBuddy.install

LoadingBuddy.configure do |config|
  config.benchmark = true
end

puts "Test init:"
[1,2,3,4,5,6].each_with_progress do
end

puts "--- --- ---"
puts "Test with Title"


LoadingBuddy.configure do |config|
  config.title = "Progress Test!"
end
[1,2,3,4,5,6].each_with_progress do
end

[1,2,3,4,5,6].each_with_index do |num, i|
  puts "#{num} - #{i}"
end
