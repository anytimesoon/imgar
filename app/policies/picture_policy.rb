class PicturePolicy < ApplicationPolicy
	def new?
		!user.nil?
	end

	def create?
		!user.nil?
	end
end