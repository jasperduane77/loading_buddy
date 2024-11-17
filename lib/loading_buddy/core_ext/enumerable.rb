module LoadingBuddy
  module CoreExt
    module Enumerable
      def each_with_progress(&block)
        return each_without_progress(&block) unless LoadingBuddy.configuration.enabled

        # Create the progress bar if items exceeds the minimum size
        gem_config = LoadingBuddy.configuration
        if respond_to?(:size) && size > gem_config.min_size
          progress = LoadingBuddy::ProgressBar.new(size, { title: gem_config.title })
          progress.start

          each_without_progress do |item|
            block.call(item)
            progress.increment
          end

          progress.finish
        else
          each_without_progress(&block)
        end
      end

      def self.included(base)
        base.class_eval do
          alias_method :each_without_progress, :each
          alias_method :each, :each_with_progress
        end
      end
    end
  end
end

