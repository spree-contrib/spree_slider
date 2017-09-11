class Spree::SlideLocation < ActiveRecord::Base
  has_and_belongs_to_many :slides,
                          ->(model) { where('spree_slides.id != ?', model.fallback_slide_id || 0) },
                          class_name: 'Spree::Slide',
                          join_table: 'spree_slide_slide_locations'

  belongs_to :fallback_slide, class_name: 'Spree::Slide', foreign_key: 'fallback_slide_id'

  validates :name, presence: true
end
