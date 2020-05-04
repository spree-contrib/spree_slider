class AddStoresSlides < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_stores_slides, id: false do |t|
      t.integer :store_id
      t.integer :slide_id
      t.timestamps null: false
    end

    add_index :spree_stores_slides, :store_id
    add_index :spree_stores_slides, :slide_id
  end
end
