class Resume < ActiveRecord::Base
  belongs_to :user
  mount_uploader :download_file, DownloadFileUploader
end
