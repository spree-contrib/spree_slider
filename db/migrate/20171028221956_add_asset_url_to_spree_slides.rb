class AddAssetUrlToSpreeSlides < ActiveRecord::Migration[5.0]
  def change
    add_column :spree_slides, :asset_url, :string
  end
end
