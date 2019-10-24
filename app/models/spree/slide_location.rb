class Spree::SlideLocation < Spree::Base

  has_and_belongs_to_many :slides,
                          class_name: 'Spree::Slide',
                          join_table: 'spree_slide_slide_locations'

  validates :name, presence: true

end
