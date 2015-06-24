class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user, link)
    @user = user  # Instance variable => available in view
    @link = link
    mail(to: @user.email, subject: t('.subject'))
  end

  def new_user(user, link)
    @user = user  # Instance variable => available in view
    @link = link
    mail(to: @user.email, subject: t('.subject'))
  end


end
