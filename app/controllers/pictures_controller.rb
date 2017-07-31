class PicturesController < ApplicationController
	after_action :verify_authorized, except: [:index, :show, :user_pictures]

	def index
		@pictures = Picture.all
	end

	def new
		@picture = Picture.new
		authorize @picture
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

		authorize @picture
	end

	def show
		@picture = Picture.find(params[:id])
		@comment = Comment.new
	end

	def user_pictures
		@user = User.find(params[:user_id])
		@pictures = @user.pictures
	end

	private

	def picture_params
		params.require(:picture).permit(:title, :path, tags_attributes: [:name])
	end

	def user_not_authorized
	  flash[:alert] = "You need to be signed in to upload stuff."
	  redirect_to new_user_session_path
	end
end
