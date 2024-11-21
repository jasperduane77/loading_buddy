module LoadingBuddy
  class ProgressBar
    def initialize(total, options = {})
      @total = total
      @current = 0
      @title = options[:title]
      # Move down one line and store position
      print "\033[s"
      # Move back up
      print "\033[A"
    end

    def start
      # Move to stored position and render
      print "\033[u\033[K"
      render
    end

    def increment
      @current += 1
      render
    end

    def finish
      print "\n"
    end

    private

    def render
      percentage = (@current.to_f / @total * 100).round(1)
      bar_width = 30
      filled = (bar_width * (percentage / 100.0)).round
      empty = bar_width - filled

      bar = if filled == bar_width
        "=" * filled
      else  
        "=" * filled + ">" + " " * empty
      end

      title_display = @title ? "#{@title}: " : ""
      # Move to stored position, clear line and print progress
      print "\033[u\033[K#{title_display}[#{bar}] #{percentage}%"
      # Move cursor back to bottom
      print "\033[B"
    end
  end
end
