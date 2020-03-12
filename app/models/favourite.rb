class Favourite < ApplicationRecord
	belongs_to :user
	belongs_to :tv_show

	def self.send_notification
		favourites= Favourite.where(is_favourite: true)
		@favourites = []
		favourites.each do |favourite|
			if ((Time.now+30.minutes).strftime("%H:%M") == favourite.tv_show.timing.strftime("%H:%M"))
				@favourites << favourite
			end
		end

		unless @favourites.blank?
			@favourites.each do |favourite|
				FavouriteMailer.notification_email(favourite).deliver
			end
		end
	end
end
