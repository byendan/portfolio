class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :projects, through: :taggings

  mount_uploader :image, ImageUploader

end
