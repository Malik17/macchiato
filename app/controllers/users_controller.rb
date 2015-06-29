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
      link =  locale_link
      UserMailer.new_user(@user, link).deliver_now
    end
    redirect_to(:back)
    # change to corporation show path if possible
  end

  def show
    @user = User.find_by_token(params[:token])
    @corporation = Corporation.find(params[:corporation_id])
    if @user.first_name == nil
      redirect_to corporation_user_edit_path(@corporation, @user.token)
    else
      @questions = next_unanswered
    end


    # if @finish_test

    # end
  end

  def edit
    @user = User.find_by_token(params[:token])
    @corporation = Corporation.find(params[:corporation_id])
  end

  def update
    @user = User.find_by_token(params[:token])
    @corporation = Corporation.find(params[:corporation_id])
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

  def email_array
    emails = params[:user][:email]
    emails.scan /([a-zA-Z0-9\-_]+@[a-zA-Z0-9\-_]+.\w+)/
  end

  def next_unanswered
    answer = user_answers.last

    if answer
      first_question = answer.question_id
    else
      first_question = 0
    end

    questions = Question.all
    last_question = questions.last.id


    #plus x gives the number of questions per page
    if last_question <= first_question + 2
      last_question
    else
      last_question = first_question + 2
    end
    questions[first_question,last_question]

  end

  def user_answers
    user = User.find_by_token(params[:token])
    Answer.all.select { |ar| ar.user_id == user.id }
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
  # option to send in different language?!

end
