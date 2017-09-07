class Spree::Slide < ActiveRecord::Base
  has_and_belongs_to_many :slide_locations,
                          class_name: 'Spree::SlideLocation',
                          join_table: 'spree_slide_slide_locations'

  has_attached_file :image,
                    url: '/spree/slides/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/slides/:id/:style/:basename.:extension',
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  validates_attachment :image, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }

  scope :published, -> { where(published: true).order('position ASC') }
  scope :location, ->(location) { joins(:slide_locations).where('spree_slide_locations.name = ?', location) }

  belongs_to :product, touch: true

  def self.active_for_current_time
    where '(starts_at is NULL AND ends_at is NULL)
           OR (starts_at <= ? AND ends_at is NULL)
           OR (starts_at is NULL AND ends_at >= ?)
           OR (starts_at <= ? AND ends_at >= ?)',
          *([Time.now] * 4)
  end

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

  def active_now?
    Time.now.between?(starts_at || 1.second.ago, ends_at || 1.second.from_now)
  end
end
