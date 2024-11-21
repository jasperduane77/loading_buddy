module LoadingBuddy
  module CoreExt
    module Enumerable
      def each_with_progress(&block)
        handle_enumeration(:each, &block)
      end

      def each_wp(&block)
        each_with_progress(&block)
      end

      def each_with_index_with_progress(&block)
        handle_enumeration(:each_with_index, &block)
      end

      def each_with_index_wp(&block)
        each_with_index_with_progress(&block)
      end

      private

      def handle_enumeration(method, &block)
        return send("#{method}_without_progress", &block) unless LoadingBuddy.configuration.enabled || !respond_to?(:size)

        # Create the progress bar if items exceeds the minimum size
        gem_config = LoadingBuddy.configuration
        if size > gem_config.min_size
          progress = LoadingBuddy::ProgressBar.new(size, { title: gem_config.title })
          progress.start

          benchmark = Benchmark.measure do
            send("#{method}_without_progress") do |item|
              block.call(item)
              progress.increment
            end
          end.real

          progress.finish

          if LoadingBuddy.configuration.benchmark?
            puts "#{LoadingBuddy.configuration.benchmark_prefix}#{benchmark.round(4)}s"
          end
        else
          send("#{method}_without_progress", &block)
        end
      end

      def self.included(base)
        base.class_eval do
          alias_method :each_without_progress, :each
          alias_method :each_with_index_without_progress, :each_with_index
        end
      end
    end
  end
end
