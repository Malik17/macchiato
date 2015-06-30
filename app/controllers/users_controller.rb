class UsersController < ApplicationController

  before_action :find_corporation, only: [:show, :edit, :update, :create]
  before_action :find_user,        only: [:show, :edit, :update]

  def new
  end

  def create
    array = email_array.flatten
    array.each do |email|
      @user =  @corporation.users.new(user_params)
      @user[:email] = email
      @user[:token] = SecureRandom.urlsafe_base64(16, true)
      @user.save
      link =  locale_link
      UserMailer.new_user(@user, link).deliver_now
    end
    redirect_to(:back)
    # change to corporation show path if possible
  end

  def show
    if @user.has_finished_test?
      redirect_to corporation_answer_show_path(@corporation, @user.token)
    elsif @user.first_name == nil
      redirect_to corporation_user_edit_path(@corporation, @user.token)
    else
      @questions = Question.not_answered_by(@user).first(5)
    end
  end

  def edit
  end

  def update
    @user.update_attributes(update_user_params)
    if @user.save
      redirect_to corporation_user_show_path(@corporation, @user.token)
    end
  end

  # def save_answer
  #   answer = Answer.new
  #   answer[:user_id] = @user.id
  #   answer[:question_id] = question.id
  #   answer[:question_result] = rand(-6..6)
  #   answer.save
  # end

  private

  def update_user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def user_params
    params.require(:user).permit(:corporation_id, :email)
  end

  def find_corporation
    @corporation = Corporation.find(params[:corporation_id])
  end

  def find_user
    @user = User.find_by_token(params[:token])
  end

  def email_array
    emails = params[:user][:email]
    emails.scan /([a-zA-Z0-9\-_]+@[a-zA-Z0-9\-_]+.\w+)/
  end

  def user_answers
    user = User.find_by_token(params[:token])
    Answer.all.select { |answer| answer.user_id == user.id }
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
  # option to send in different language

end
