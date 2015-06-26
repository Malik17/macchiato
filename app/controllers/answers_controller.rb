class AnswersController < ApplicationController
  def create
    # redirect_to(:back)
    @user = User.find_by_token(params[:token])

    params[:question_result].each do |key, value|
      @answer = Answer.new
      @answer[:question_id] = key
      @answer[:question_result] = value
      @answer[:user_id] = @user.id
      @answer.save
    end
    if @answer[:question_id] == Question.all.length
      @corporation = Corporation.find(params[:corporation_id])
      redirect_to(corporation_answer_show_path(@corporation, @user.token))
    else
      redirect_to(corporation_user_show_path)
    end
  end

  def show
  end


  private

  def answer_params
    params.require(:answer).permit(:question_result, :token)
  end

end
