module WikisHelper

	def checked(wiki, user)
		wiki.collaborators.collect { |c| c.user_id }.include?(user.id)
	end
end
