module Spree
  module V2
    module Storefront
      class SlideLocationSerializer < BaseSerializer
        set_type :slide_location

        attributes :name

        has_many :slides
      end
    end
  end
end
