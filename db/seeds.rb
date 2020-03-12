# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

channels = JSON.parse(File.open("db/channel_list.json").read) rescue nil
unless channels.blank?
	channels.each do |channel|
		Channel.find_or_create_by(name: channel[0])
	end
end

tv_shows = JSON.parse(File.open("db/tv_show.json").read) rescue nil
unless tv_shows.blank?
	tv_shows.each do |tv_show|
		tv_show[1].each do |show_data|
			TvShow.find_or_create_by(channel_id: tv_show[0], name: show_data.keys[0], timing:show_data.values[0] )
		end
	end
end