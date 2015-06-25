class AnswersController < ApplicationController
  def create
    # redirect_to(:back)
    byebug
    @user = @user = User.find_by_token(params[:token])
    @answer = Answer.create(answer_params)
    @answer[:user_id] = @user.id
    @answer.save
    redirect_to(thank_you_path)
  end


  private

  def answer_params
    params.require(:answer).permit(:question_result, :token)
  end

end
