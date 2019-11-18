class AddProductIdToSlides < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_slides, :product_id, :integer
  end
end
