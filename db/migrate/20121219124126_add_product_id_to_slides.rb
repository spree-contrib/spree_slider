class AddProductIdToSlides < SpreeExtension::Migration[5.0]
  def change
    add_column :spree_slides, :product_id, :integer
  end
end
