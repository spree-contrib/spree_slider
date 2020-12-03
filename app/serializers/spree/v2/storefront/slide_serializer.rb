module Spree
  module V2
    module Storefront
      class SlideSerializer < BaseSerializer
        set_type :slide

        attributes :name, :slide_name,:slide_link, :slide_image, :preview, :thumbnail

        # has_one :image

      end
    end
  end
end
