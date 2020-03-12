module TvShowsHelper

	def get_checked_favourite(tv_show)
		current_user.favourites.find_by(tv_show_id: tv_show.id).is_favourite rescue nil
	end
end
