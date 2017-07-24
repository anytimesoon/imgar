class PicturesController < ApplicationController
	def index
		@pictures = Picture.all
	end

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		@picture.user_id = current_user.id
		
		if @picture.save
			redirect_to picture_path(@picture)
		else
			flash[:notice] = "Something went wrong, please try again"
			redirect_to request.referer
		end
	end

	def show
		@picture = Picture.find(params[:id])
	end

	private

	def picture_params
		params.require(:picture).permit(:path)
	end
end
