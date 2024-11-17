require "loading_buddy"

LoadingBuddy.install

puts "Test init:"
[1,2,3,4,5,6].each do
end

puts "--- --- ---"
puts "Test with Title"


LoadingBuddy.configure do |config|
  config.title = "Progress Test!"
end
[1,2,3,4,5,6].each do
end
