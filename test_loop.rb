require "loading_buddy"

LoadingBuddy.install

LoadingBuddy.configure do |config|
  config.benchmark = true
end

# puts "Test init:"
# [1,2,3,4,5,6].each_with_progress do
# end

# puts "--- --- ---"
# puts "Test with Title"


# LoadingBuddy.configure do |config|
#   config.title = "Progress Test!"
# end

[1,2,3,4,5,6].each_wp do
  sleep(0.5)
end

[1,2,3,4,5,6].each_with_progress do
  sleep(0.5)
end

require "loading_buddy"

LoadingBuddy.install

LoadingBuddy.configure do |config|
  config.benchmark = true
end

[1,2,3,4,5,6].each_with_index_wp do |num, i|
  sleep(0.5)
end
