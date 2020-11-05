module Spree
  module Admin
    module SlidesHelper
      def get_column_header_by_type(type)
        if type == :image
          return Spree.t(:name)
        end
        if type == :product
          return Spree.t(:product)
        end
      end

      def get_image_link_by_type(slide, type)
        if type == :image
          return link_to slide.name, object_url(slide)
        end
        if type == :product
          return slide.product ? link_to(slide.product.name, object_url(slide)) : '---'
        end
      end
    end
  end
end
