class Spree::Slide < ActiveRecord::Base

  has_and_belongs_to_many :slide_locations,
                          class_name: 'Spree::SlideLocation',
                          join_table: 'spree_slide_slide_locations'

  has_attached_file :image,
                    url: '/spree/slides/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/slides/:id/:style/:basename.:extension',
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  scope :published, -> { where(published: true).order('position ASC') }
  scope :location, -> (location) { joins(:slide_locations).where('spree_slide_locations.name = ?', location) }

  belongs_to :product, touch: true, optional: true

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
    !image.file? && product.present? && product.images.any? ? product.images.first.attachment : image
  end
  
  #Get image url for specific style (product, small, original, custom, etc.). If style does not exists => get default_style
  def slide_image_url( style_name=nil )
    slide_image.options[:styles].has_key?(style_name) or style_name == :original ? slide_image.url(style_name) : slide_image.url
  end
  
end
