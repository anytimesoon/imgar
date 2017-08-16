class PicturesController < ApplicationController
	after_action :verify_authorized, except: [:index, :show, :user_pictures, :top]

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
		@picture.add_rating

		if @picture.save
			redirect_to picture_path(@picture)
		else
			render :new
		end

		authorize @picture
	end

	def show
		@picture = Picture.find(params[:id])
		@comment = Comment.new
		@rating = @picture.rating
	end

	def user_pictures
		@user = User.find(params[:user_id])
		@pictures = @user.pictures
	end

	def top
		@pictures = Picture.top_rated
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
