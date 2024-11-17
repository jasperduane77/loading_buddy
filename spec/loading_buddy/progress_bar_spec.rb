require "loading_buddy"

RSpec.describe LoadingBuddy::ProgressBar do
  let(:progress_bar) { described_class.new(100, title: "Test") }

  describe '#initialize' do
    it 'creates a new progress bar with correct total' do
      expect(progress_bar.instance_variable_get(:@total)).to eq(100)
    end

    it 'sets the title correctly' do
      expect(progress_bar.instance_variable_get(:@title)).to eq("Test")
    end
  end
end
