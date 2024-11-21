require "loading_buddy"

RSpec.describe LoadingBuddy::CoreExt::Enumerable do
  shared_examples "checking log behavior" do
    let(:progress_bar) { instance_double(LoadingBuddy::ProgressBar) }

    before do
      allow(LoadingBuddy::ProgressBar).to receive(:new).and_return(progress_bar)
    end

    context 'with more than min size' do
      it 'should log multiple times' do
        expect(progress_bar).to receive(:start).once
        expect(progress_bar).to receive(:increment).exactly(items_with_more.size).times
        expect(progress_bar).to receive(:finish).once

        subject
      end
    end

    context 'less than min size' do
      subject { items_with_less.each_with_progress {} }
      it 'should NOT log multiple times' do
        expect(progress_bar).to receive(:start).never
        expect(progress_bar).to receive(:finish).never
        subject
      end
    end
  end

  shared_examples "each logging behavior" do
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
  end

  let(:min_size) { 6 }
  let(:benchmark) { false }
  before do
    LoadingBuddy.install
    LoadingBuddy.configure do |config|
      config.min_size = min_size
      config.benchmark = benchmark
    end
  end

  describe '#each_with_progress' do
    subject { items_with_more.each_with_progress {} }

    it_behaves_like "each logging behavior"

    context 'short version - each_wp' do
      subject { items_with_more.each_wp {} }

      it_behaves_like "each logging behavior"
    end
  end

  describe '#each_with_index' do
    subject { items_with_more.each_with_index_with_progress {} }

    it_behaves_like "each logging behavior"

    context 'short version - each_with_index_wp' do
      subject { items_with_more.each_with_index_wp {} }

      it_behaves_like "each logging behavior"
    end
  end
end
