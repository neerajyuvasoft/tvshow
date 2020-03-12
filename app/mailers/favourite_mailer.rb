class FavouriteMailer < ApplicationMailer
  default from: 'notifications@example.com'

	def notification_email(favourite)
    @favourite = favourite
    @tv_show = favourite.tv_show
    @user = favourite.user
    mail(to:  @user.email, subject: 'Your Favourite Show coming after 30 mins')
  end
end
