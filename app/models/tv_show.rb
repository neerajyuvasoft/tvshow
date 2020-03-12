class TvShow < ApplicationRecord
	belongs_to :channel
	has_many :favourites

	def self.search(params)
		where("name LIKE (?)", "%#{params[:search]}%")
	end
end
