class Bubble < ActiveRecord::Base
  validates :text, presence: true, length: {maximum: 20}
end
