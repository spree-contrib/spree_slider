class AddProductIdToSlides < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_slides, :product_id, :integer
  end
end
