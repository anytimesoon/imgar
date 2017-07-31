class Rating < ApplicationRecord
	has_many :user_ratings
	has_many :users, through: :user_ratings
	belongs_to :picture

	def average
		average = (self.value / self.total_votes)
		average.to_f / 10
	end
end
