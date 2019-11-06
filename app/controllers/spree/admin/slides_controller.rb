module Spree
  module Admin
    class SlidesController < ResourceController
      respond_to :html

      before_action :find_slide, only: [:move_up, :move_down]

      def index
        @slides = Spree::Slide.order(:position)
      end

      def move_up
        @slide.move_higher
        redirect_to admin_slides_path
      end

      def move_down
        @slide.move_lower
        redirect_to admin_slides_path
      end

      private

      def find_slide
        @slide = Spree::Slide.find(params[:slide_id])
      end

      def location_after_save
        if @slide.created_at == @slide.updated_at
          edit_admin_slide_url(@slide)
        else
          admin_slides_url
        end
      end

      def slide_params
        params.require(:slide).permit(:name, :body, :link_url, :published, :image, :position, :product_id)
      end
    end
  end
end
