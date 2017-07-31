class RatingsController < ApplicationController
	def update
		@picture = Picture.find(params[:picture_id])
		@rating = @picture.rating

		@rating.value += params[:rating][:value].to_i * 10
		@rating.users << current_user
		@rating.total_votes += 1

		@rating.save

		redirect_to picture_url(@picture)
	end
end
