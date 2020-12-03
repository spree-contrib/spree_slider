module Spree
  module Api
    module V2
      module Storefront
        class SlideLocationsController < ::Spree::Api::V2::BaseController
          def show
            render_serialized_payload { serialize_resource(resource) }
          end

          private

          def scope
            Spree::SlideLocation
          end

          def resource
            scope.find(id: params[:id])
          end

          def resource_serializer
            Spree::V2::Storefront::SlideLocationSerializer
          end
        end
      end
    end
  end
end
