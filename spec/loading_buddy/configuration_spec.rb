require "loading_buddy"

RSpec.describe LoadingBuddy::Configuration do
  describe 'default configuration' do
    it 'has default enabled value' do
      config = LoadingBuddy::Configuration.new
      expect(config.enabled).to be true
    end

    it 'has default minimum size' do
      config = LoadingBuddy::Configuration.new
      expect(config.min_size).to eq(5)
    end
  end

  describe 'with custom configuration' do
    before do
      LoadingBuddy.configure do |config|
        config.enabled = true
        config.min_size = 10
      end
    end

    it 'should assign the correct values' do
      expect(LoadingBuddy.configuration.enabled).to be true
      expect(LoadingBuddy.configuration.min_size).to be 10
    end

    context 'when disabled' do
      before do
        LoadingBuddy.configure do |config|
          config.enabled = false
        end
      end

      it 'should be disabled' do
        expect(LoadingBuddy.configuration.enabled). to be false
      end
    end
  end
end
