module ApplicationHelper
	def readable_timestamp(model)
		model.created_at.strftime('%c')
	end
end
