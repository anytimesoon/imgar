class CommentsController < ApplicationController
	def create
		binding.pry
		@comment = Comment.new(comment_params)

		@comment.user_id = current_user.id

		if @comment.save
			redirect_to picture_path(@picture)
		else
			flash[:notice] = "Something went wrong, please try again"
			redirect_to request.referer
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end
