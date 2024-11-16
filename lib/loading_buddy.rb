require "loading_buddy/version"
require "loading_buddy/configuration"

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
