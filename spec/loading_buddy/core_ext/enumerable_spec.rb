require "loading_buddy"

RSpec.describe LoadingBuddy::CoreExt::Enumerable do
  describe 'simple loop' do
    before do
      LoadingBuddy.install
    end

    it 'should call puts multiple times' do
      expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:start)
      # TODO: Fix this spec by adding environment variables
      [1,2,3,4].each do
      end
    end
  end
end
