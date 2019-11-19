module Spree
  module ProductDecorator
    def self.prepended(base)
      base.has_one :slide
      base.after_destroy :destroy_slide_if_deleted
    end

    def destroy_slide_if_deleted
      slide.update(published: false) if slide && deleted_at
    end
  end
end

::Spree::Product.prepend(Spree::ProductDecorator)