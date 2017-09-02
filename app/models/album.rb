class Album < ActiveRecord::Base
  has_many :photos, :dependent => :destroy
  mount_uploader :preview_image, PreviewImageUploader
end