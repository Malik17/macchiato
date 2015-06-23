class CorporationsController < ApplicationController

  def new
    @corporation = Corporation.new
  end

  def create
    @corporation = Corporation.create(corporation_params)
    @corporation[:token] = SecureRandom.urlsafe_base64(32, true)

    if @corporation.save
      redirect_to thank_you_path, notice: 'Castle was successfully created.'
    else
      render :new
    end
    # mail_to
  end

  def show
    @corporation = Corporation.find(params[:id])
  end

  def update
  end

  def edit
  end

  private

  def corporation_params
    params.require(:corporation).permit(:name,:division,:contact_first,:contact_last,:email)
  end

end
