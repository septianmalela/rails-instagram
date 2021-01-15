class AttachmentPost < ApplicationRecord
	mount_uploader :foto, FotoUploader
	belongs_to :post
end
