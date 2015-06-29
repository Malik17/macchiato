class CorporationsController < ApplicationController

  def new
    @corporation = Corporation.new
  end

  def create
    @corporation = Corporation.create(corporation_params)
    @corporation[:token] = SecureRandom.urlsafe_base64(16, true)

    if @corporation.save
      link =  locale_link
      UserMailer.welcome(@corporation, link).deliver_now
      redirect_to thank_you_path, notice: 'Corporation was successfully created.'
    else
      render :new
    end
  end

  def show
    @corporation = Corporation.find_by_token(params[:token])
    @users = @corporation.users
    @answers = Answer.joins(:user).where(users:{corporation_id: @corporation})
  end

  def update
  end

  def edit
  end



  private

  def corporation_params
    params.require(:corporation).permit(:name,:division,:contact_first,:contact_last,:email)
  end

  def locale_link
    if  locale == :nl
      return "nl/"
    elsif  locale == :fr
      return "fr/"
    else
      return ""
    end
  end

end
