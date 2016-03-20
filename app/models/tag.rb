class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :projects, through: :taggings

  mount_uploader :image, ImageUploader

  default_scope -> { order(created_at: :asc) }

  validates :name, presence: true
  validates :content, presence: true
  validates :image, presence: true

end
