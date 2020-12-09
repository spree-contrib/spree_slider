module Spree
  module V2
    module Storefront
      class SlideSerializer < BaseSerializer
        set_type :slide

        attributes :name, :body, :slide_name, :slide_link, :slide_image_url

      end
    end
  end
end
