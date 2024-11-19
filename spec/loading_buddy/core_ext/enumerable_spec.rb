require "loading_buddy"

RSpec.describe LoadingBuddy::CoreExt::Enumerable do
  describe '#each_with_progress' do
    let(:min_size) { 6 }

    before do
      LoadingBuddy.install
      LoadingBuddy.configure do |config|
        config.min_size = min_size
      end
    end

    shared_examples "checking log behavior" do
      context 'with more than min size' do       
        subject { items_with_more.each_with_progress {} }
        it 'should log multiple times' do
          expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:start).once
          expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:increment)
            .exactly(7)
            .times
          expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:finish).once

          subject
        end
      end

      context 'less than min size' do
        subject { items_with_less.each_with_progress {} }
        it 'should NOT log multiple times' do
          expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:start).never
          expect_any_instance_of(LoadingBuddy::ProgressBar).to receive(:finish).never
          subject
        end
      end
    end

    context 'with normal items' do
      let(:items_with_more) { [1,2,3,4,5,6,7] }
      let(:items_with_less) { [1,2,3,4] }

      it_behaves_like "checking log behavior"
    end

    context 'with hashes' do
      let(:items_with_more) { [{num: 1},{num: 2},{num: 3},{num: 4},{num: 5},{num: 6},{num: 7}] }
      let(:items_with_less) { [{num: 1},{num: 2},{num: 3},{num: 4}] }

      it_behaves_like "checking log behavior"
    end

    context 'with range' do
      let(:items_with_more) { 1..7 }
      let(:items_with_less) { 1..4 }

      it_behaves_like "checking log behavior"
    end

    context 'with index' do
      
      let(:items_with_more) { 1..7 }
      let(:items_with_less) { 1..4 }

      it_behaves_like "checking log behavior"
    end
  end
end
