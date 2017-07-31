class Tag < ApplicationRecord
	has_many :picture_tags
	has_many :pictures, through: :picture_tags

	before_validation :slugify

	validates :name, :slug, presence: true

	def to_param
		slug
	end

	def slugify
		self.slug = name.gsub(' ', '_').downcase
	end

end
