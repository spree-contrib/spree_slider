class AddStartsAtAndEndsAtColumnsToSpreeSlides < ActiveRecord::Migration
  def change
    add_column :spree_slides, :starts_at, :datetime
    add_column :spree_slides, :ends_at, :datetime
  end
end
