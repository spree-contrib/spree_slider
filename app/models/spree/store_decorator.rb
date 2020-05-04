module Spree
  Store.class_eval do
    has_and_belongs_to_many :slides, join_table: 'spree_stores_slides'
  end
end

