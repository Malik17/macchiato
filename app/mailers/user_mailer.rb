class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: t('.subject'))
  end

  def new_user(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: t('.subject'))
  end


end
