class Photo < ActiveRecord::Base
  attr_accessible :gallery_id, :image
  belongs_to :gallery
  mount_uploader :image, ImageUploader
end
