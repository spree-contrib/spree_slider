class AddPositionToSlides < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_slides, :position, :integer, :null => false, :default => 0
  end
end
