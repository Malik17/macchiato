class AnswersController < ApplicationController
  def create
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
    @answers = Answer.all
    @questions = Question.all
    x = 0
    y = 0
    @answers.each do |answer|
      right_question_id = answer.question_id - 1
      x += @questions[right_question_id].x_impact * answer.question_result.to_i
      y += @questions[right_question_id].y_impact * answer.question_result.to_i
      z += @questions[right_question_id].z_impact * answer.question_result.to_i
      @result = [x,y,z]
    end
    # angle_calculation(@result[0], @result[1])
    angle_calculation(-1,-1)
    @category = calculate_category(@angle, @result[2])
  end


  private

  def answer_params
    params.require(:answer).permit(:question_result, :token)
  end

  def angle_calculation(x,y)
    @angle = Math.atan2(x,y)
  end

  def calculate_category(angle,z)
    if 0 <= angle && angle <= Math::PI/2
      category = 1
    elsif Math::PI/2 < angle && angle <= Math::PI
      category = 2
    elsif -Math::PI < angle && angle <= -Math::PI/2
      category = 3
    elsif -Math::PI/2 < angle && angle <= -0
      category = 4
    else
      "oops"
    end

    if z >= 0
      category += 4
    end
    category
    # quart sup droit: 1 ou 5
    # quart inf droit: 2 ou 6
    # quart inf gauche: 3 ou 7
    # quart sup gauche: 4 ou 8
  end


end
