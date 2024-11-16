module LoadingBuddy
  class ProgressBar
    def initialize(total, options = {})
      @total = total
      @current = 0
      @title = options[:title]
    end

    def start
      render
    end

    def increment
      @current += 1
      render
    end

    def finish
      render
      puts # Add a new line once its finished
    end

    private

    def render
      percentage = (@current.to_f / @total * 100).round(1)
      bar_width = 30
      filled = (bar_width * (percentage / 100.0)).round
      empty = bar_width - filled
      
      bar = "=" * filled
      bar += ">" if filled < bar_width
      bar += " " * (empty - 1) if empty.positive?

      title_display = @title ? "#{@title}: " : ""
      print "\r#{title_display}[#{bar}] #{percentage}%"
    end
  end
end
