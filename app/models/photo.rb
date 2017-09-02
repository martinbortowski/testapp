class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :gallery_image, GalleryImageUploader
end