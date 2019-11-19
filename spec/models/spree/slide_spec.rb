require_relative '../../spec_helper.rb'

describe Spree::Slide do
  describe '.published' do
    let!(:slide_1) { create(:image_slide) }
    let!(:slide_2) { create(:product_slide) }
    let!(:slide_3) { create(:product_slide, published: false) }

    it 'returns only published slides' do
      expect(described_class.published).to contain_exactly(slide_1, slide_2)
    end
  end

  describe '.product_slides' do
    let!(:slide_1) { create(:image_slide) }
    let!(:slide_2) { create(:product_slide) }
    let!(:slide_3) { create(:product_slide, published: false) }

    it 'returns only product slides' do
      expect(described_class.product_slides).to contain_exactly(slide_2)
    end
  end

  describe '.image_slides' do
    let!(:slide_1) { create(:image_slide) }
    let!(:slide_2) { create(:product_slide) }
    let!(:slide_3) { create(:product_slide, published: false) }

    it 'returns only product slides' do
      expect(described_class.image_slides).to contain_exactly(slide_1)
    end
  end

  describe '.image_slides' do
    let!(:slide_loc_1) { create(:slide_location, name: '1') }
    let!(:slide_loc_2) { create(:slide_location, name: '2') }
    let!(:slide_1) { create(:image_slide, slide_locations: [slide_loc_1]) }
    let!(:slide_2) { create(:image_slide, slide_locations: [slide_loc_2]) }

    it 'returns only slides in location' do
      expect(described_class.location(slide_loc_1.name)).to contain_exactly(slide_1)
    end
  end

  describe '#slide_name' do
    context 'product slide' do
      let!(:product_slide) { create(:product_slide) }

      it 'returns product name' do
        expect(product_slide.slide_name).to eq product_slide.product.name
      end
    end

    context 'image slide' do
      let!(:image_slide) { create(:image_slide) }

      it 'returns custom name' do
        expect(image_slide.slide_name).to eq image_slide.name
      end
    end
  end

  describe '#slide_link' do
    context 'product slide' do
      let!(:product_slide) { create(:product_slide) }

      it 'returns product' do
        expect(product_slide.slide_link).to eq product_slide.product
      end
    end

    context 'image slide' do
      let!(:image_slide) { create(:image_slide) }

      it 'returns custom link' do
        expect(image_slide.slide_link).to eq image_slide.link_url
      end
    end
  end

  describe '#slide_image' do
    context 'product slide' do
      let!(:product_slide) { create(:product_slide) }
      let!(:image) { instance_double('Spree::Image') }
      let!(:image_wrapper) { double('image warpper', attachment: image) }

      before do
        allow(product_slide.product).to receive(:images).and_return [image_wrapper]
      end

      it 'returns product image' do
        expect(product_slide.slide_image).to be image
      end
    end

    context 'image slide' do
      let!(:image_slide) { create(:image_slide) }

      it 'returns custom image' do
        expect(image_slide.slide_image).to be_kind_of(ActiveStorage::Attachment)
      end
    end
  end

  describe '#preview' do
    let!(:image_slide) { create(:image_slide) }

    it 'returns custom image' do
      expect(image_slide.preview).to be_kind_of(ActiveStorage::Variant)
    end
  end

  describe '#thumbnail' do
    let!(:image_slide) { create(:image_slide) }

    it 'returns custom image' do
      expect(image_slide.thumbnail).to be_kind_of(ActiveStorage::Variant)
    end
  end
end
