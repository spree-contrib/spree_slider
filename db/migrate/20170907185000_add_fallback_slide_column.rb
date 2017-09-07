class AddFallbackSlideColumn < ActiveRecord::Migration
  def change
    add_column 'spree_slide_locations', :fallback_slide_id, :integer, default: nil
  end
end
