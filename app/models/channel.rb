class Channel < ApplicationRecord
	has_many :tv_shows

	def self.search(params)
		where("name LIKE (?)", "%#{params[:search]}%")
	end
end
