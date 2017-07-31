class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@picture = Picture.find(params[:picture_id])

		@comment.user_id = current_user.id
		@comment.picture_id = @picture.id

		if @comment.save
			redirect_to picture_path(@picture)
		else
			flash[:notice] = "Something went wrong, please try again"
			redirect_to request.referer
		end

		authorize @comment
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
