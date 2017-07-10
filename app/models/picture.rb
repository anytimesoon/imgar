class Picture < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :tags

	validates :path, presence: true
end
