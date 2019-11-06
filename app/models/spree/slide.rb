class Spree::Slide < Spree::Base

  has_and_belongs_to_many :slide_locations,
                          class_name: 'Spree::SlideLocation',
                          join_table: 'spree_slide_slide_locations'

  has_one_attached :image

  scope :published, -> { where(published: true).order('position ASC') }
  scope :location, -> (location) { joins(:slide_locations).where('spree_slide_locations.name = ?', location) }

  belongs_to :product, touch: true

  def initialize(attrs = nil)
    attrs ||= { published: true }
    super
  end

  def slide_name
    name.blank? && product.present? ? product.name : name
  end

  def slide_link
    link_url.blank? && product.present? ? product : link_url
  end

  def image?
    image.attached?
  end

  def slide_image
    blob = image? ? image.attachment.blob : product.images.first.attachment.blob
    Rails.application.routes.url_helpers.rails_blob_url(blob, only_path: true)
  end

end
