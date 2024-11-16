require "loading_buddy"

progress = LoadingBuddy::ProgressBar.new(100, title: "Processing")

progress.start

100.times do
  sleep(0.1)
  progress.increment
end

progress.finish
