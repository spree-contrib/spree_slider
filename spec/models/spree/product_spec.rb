require_relative '../../spec_helper.rb'

describe Spree::Product do
  let!(:slide_product) { create(:product) }
  let!(:product_slide) { create(:product_slide, product: slide_product) }

  context 'hooks' do
    it 'sets slide to not published if destroyed' do
      slide_product.destroy

      expect(product_slide.reload.published?).to be false
    end
  end
end
