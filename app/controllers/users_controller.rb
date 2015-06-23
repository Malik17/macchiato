class UsersController < ApplicationController

  before_action :find_corporation, only: [:create]

  def new
  end

  def create
    array = email_array.flatten
    array.each do |email|
      @user =  @corporation.users.new(user_params)
      @user[:email] = email
      @user[:token] = SecureRandom.urlsafe_base64(16, true)
      @user.save
      UserMailer.new_user(@user).deliver_now
    end
    redirect_to root_path
    # change to corporation show path if possible
  end

  def update
  end

  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:corporation_id, :first_name, :last_name, :email)
  end

  def find_corporation
    @corporation = Corporation.find(params[:corporation_id])
  end

  def email_array
    emails = params[:user][:email]
    emails.scan /([a-zA-Z0-9\-_]+@[a-zA-Z0-9\-_]+.\w+)/
  end

end
