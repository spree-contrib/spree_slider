FactoryBot.define do
  factory :image_slide, class: Spree::Slide do
    name { FFaker::Lorem.word }
    body { FFaker::Lorem.sentence }
    link_url { 'https://test.invalid/slider/example' }
    published { true }

    before(:create) do |slide|
      slide.image.attach(io: File.open('lib/spree_slider/factories/resources/sample.png'), filename: 'slider.png')
    end
  end

  factory :product_slide, class: Spree::Slide do
    published { true }

    association :product
  end
end
