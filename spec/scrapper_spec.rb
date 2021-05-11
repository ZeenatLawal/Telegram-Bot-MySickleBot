require './lib/scrapper'

module Scrapper
  describe Health do
    let(:title) { Scrapper::Health.new }
    describe '#health_tips_title' do
      it 'returns an array of titles' do
        expect(title.health_tips_title).to be_a Array
      end

      it 'return false if array is empty' do
        expect(title.health_tips_title.nil?).to be false
      end

      it 'return false if array contains Integers' do
        expect(title.health_tips_title.is_a?(Integer)).to be false
      end

      it 'return true if array contains Strings' do
        expect(title.health_tips_title.all?(String)).to be true
      end
    end

    describe '#health_tips' do
      it 'returns an array of content' do
        expect(title.health_tips).to be_a Array
      end

      it 'return false if array is empty' do
        expect(title.health_tips.nil?).to be false
      end

      it 'return false if array contains Integers' do
        expect(title.health_tips.is_a?(Integer)).to be false
      end

      it 'return true if array contains Strings' do
        expect(title.health_tips.all?(String)).to be true
      end
    end
  end
end
