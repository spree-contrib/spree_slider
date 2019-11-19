require_relative '../../spec_helper.rb'

describe Spree::SlideLocation do
  context 'validations' do
    it 'needs a name' do
      sl = Spree::SlideLocation.new(name: nil)
      expect(sl.save).to be false
    end
  end
end
