class HomeController < ApplicationController

  def home
  end

  def index
  end

  def contact_form
    email = params[:email]
    name = params[:name]
    message = params[:message]
    UserMailer.contacter(email, name, message).deliver_now
    redirect_to(:back)
  end

  def thank_you
  end

end
