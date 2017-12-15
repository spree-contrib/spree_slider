module SpreeSlider
  module Generators
    class InstallGenerator < Rails::Generators::Base

      argument :file_name, :type => :string, :desc => 'rails app_path', :default => '.'

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/frontend/all.js', "//= require spree/frontend/spree_slider\n"
      end

    end
  end
end
