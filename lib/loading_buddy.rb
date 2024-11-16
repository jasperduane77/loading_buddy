require "loading_buddy/version"
require "loading_buddy/configuration"
require "loading_buddy/progress_bar"

module LoadingBuddy
  class << self
    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
