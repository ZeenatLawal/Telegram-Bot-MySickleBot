require './lib/health_tips'

module Scrapper
  describe Health do
    let(:title) { Scrapper::Health.new }
    describe '#tips_heading' do
      it 'return an array of titles' do
        expect(title.tips_heading).to be_a Array
      end
    end
  end
end
