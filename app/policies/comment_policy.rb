class CommentPolicy < ApplicationPolicy
	def create?
		!user.nil?
	end
end