class Gallery < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :photos, :dependent => :destroy
  belongs_to :main_photo, :class_name => "Photo", :foreign_key => "photo_id"
end
