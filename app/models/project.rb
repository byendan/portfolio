class Project < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :content, presence: true
  validates :image, presence: true
  validates :github, presence: true
  validates :site, presence: true
  validate :valid_addresses

  private

    def valid_addresses
      [github, site].each do |address|
        errors.add(:base, "#{address} has invalid transfer protocol") unless /http|https/.match(address)
        errors.add(:base, "#{address} has invalid top level domain") unless /.(com|net|gov|io|co|biz)/.match(address)

      end
    end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).projects
  end
end
