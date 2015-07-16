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

  def contacter(email, name, message)
    @email = email
    @name = name
    @message = message
    mail(to: "m.dauber@me.com", subject: "New contact")
  end

  def finish(corporation)
    @name = corporation.name
    @id = corporation.id
    @contact_first = corporation.contact_first
    @contact_last = corporation.contact_last
    @email = corporation.email
    mail(to: "m.dauber@me.com", subject: "Finished campaign")
  end

end
