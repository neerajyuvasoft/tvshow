class TvShowsController < ApplicationController
  def index
  	@tv_shows = TvShow.all
  end

  def add_remove_favourite
  	tv_show = TvShow.find_by(id: params[:id])
		favourite = current_user.favourites.find_or_create_by(tv_show_id: tv_show.id)
  	favourite.is_favourite == false ? favourite.update(is_favourite: true) : favourite.update(is_favourite: false)
  end

  def search
  	@tv_show = TvShow.search(params)
  	@channel = Channel.search(params)
  	@channel_tv_show = TvShow.where(channel_id: @channel.ids)
  	@all_shows = @tv_show + @channel_tv_show
  	@tv_shows = TvShow.where(id: @all_shows.map{|p| p.id}.uniq)
  end
end
