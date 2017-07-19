class Picture < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :picture_tags
	has_many :tags, through: :picture_tags

	validates :path, presence: true

	has_attached_file :path, styles: { medium: "500x500>", small: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :path, content_type: /\Aimage\/.*\z/
end
