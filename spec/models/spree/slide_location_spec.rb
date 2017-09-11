require 'spec_helper'

RSpec.describe Spree::SlideLocation do
  let(:slide1) { Spree::Slide.create }
  let(:slide2) { Spree::Slide.create }

  describe '#slides' do
    before do
      Spree::SlideLocation.create name: 'Test location',
                                  slides: [slide1, slide2],
                                  fallback_slide: slide1
    end

    it 'doesnt include its fallback slide' do
      location = Spree::SlideLocation.find_by! name: 'Test location'
      expect(location.slides.map(&:id)).to contain_exactly slide2.id
    end
  end
end
