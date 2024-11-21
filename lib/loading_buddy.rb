require 'benchmark'
require "loading_buddy/version"
require "loading_buddy/configuration"
require "loading_buddy/progress_bar"
require "loading_buddy/core_ext/enumerable"

module LoadingBuddy
  class << self
    def install
      [Range, Hash, Array].each do |klass|
        klass.include CoreExt::Enumerable
      end

      # Add for activerecord if needed
    end

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end
end
