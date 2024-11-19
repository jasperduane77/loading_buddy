require "loading_buddy"

RSpec.describe LoadingBuddy::CoreExt::Enumerable do
  describe 'simple loop' do
    let(:min_size) { 6 }

    before do
      LoadingBuddy.install
      LoadingBuddy.configure do |config|
        config.min_size = min_size
      end
    end

    subject {
      items.each_with_progress {}
    }

    context 'with normal items' do
      context 'with more than min size' do
        let(:items) { [1,2,3,4,5,6,7] }

        it 'should log multiple times' do
          expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:start).once
          # expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:increment)
          #   .exactly(6)
          #   .times
          expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:finish).once

          subject
        end
      end

      context 'less than min size' do
        let(:items) { [1,2,3,4] }

        it 'should NOT log multiple times' do
          expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:start).never
          expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:finish).never
          subject
        end
      end
    end
  end
end
