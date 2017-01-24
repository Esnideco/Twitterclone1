class Post < ApplicationRecord
  belongs_to :user

  mount_uploader :attachment, AttachmentUploader
has_many :users, through: :likes
has_many :likes 
end
