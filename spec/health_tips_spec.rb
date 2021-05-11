require './lib/scrapper'

module Scrapper
  describe Health do
    let(:title) { Scrapper::Health.new }
    describe '#tips_heading' do
      it 'returns an array of titles' do
        expect(title.tips_heading).to be_a Array
      end

      it 'return false if array is empty' do
        expect(title.tips_heading.nil?).to be false
      end

      it 'return false if array contains Integers' do
        expect(title.tips_heading.is_a?(Integer)).to be false
      end

      it 'return true if array contains Strings' do
        expect(title.tips_heading.all?(String)).to be true
      end
    end

    describe '#tips_content' do
      it 'returns an array of content' do
        expect(title.tips_content).to be_a Array
      end

      it 'return false if array is empty' do
        expect(title.tips_content.nil?).to be false
      end

      it 'return false if array contains Integers' do
        expect(title.tips_content.is_a?(Integer)).to be false
      end

      it 'return true if array contains Strings' do
        expect(title.tips_content.all?(String)).to be true
      end
    end
  end
end
