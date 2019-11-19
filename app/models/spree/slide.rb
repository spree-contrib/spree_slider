class Spree::Slide < ActiveRecord::Base
  has_and_belongs_to_many :slide_locations,
                          class_name: 'Spree::SlideLocation',
                          join_table: 'spree_slide_slide_locations'

  belongs_to :product, touch: true, optional: true

  has_one_attached :image

  validates :name, :link_url, :image, presence: true, unless: -> { product }
  validates :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  scope :published, -> { where(published: true).order('position ASC') }
  scope :location, ->(location) { joins(:slide_locations).where('spree_slide_locations.name = ?', location) }
  scope :product_slides, -> { published.where.not(product_id: nil).order('position ASC') }
  scope :image_slides, -> { published.where(product_id: nil).order('position ASC') }

  STYLES = {
    preview: [120, 120],
    thumbnail: [240, 240]
  }.freeze

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

  def slide_image
    !image.attached? && product.present? && product.images.any? ? product.images.first.attachment : image.attachment
  end

  # Helper for resizing
  def preview
    image_variant(:preview)
  end

  def thumbnail
    image_variant(:thumbnail)
  end

  private

  def image_variant(variant)
    slide_image.variant(resize_to_limit: STYLES[variant])
  end
end
