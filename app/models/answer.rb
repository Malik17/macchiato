class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  Result = Struct.new(:v, :vmax) do
    def angle
      @angle ||= Math.atan2(v.x,v.y)
    end
    def category
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

      if v.z >= 0
        category += 4
      end
      category
    end
  end

  def self.new_result(userid)
    @answers = Answer.all.where(user_id: userid)
    @questions = Question.all
    v = Vector.new(0,0,0)
    vmax = Vector.new(0,0,0)

    @answers.each do |answer|
      right_question_id = answer.question_id - 1
      v    = v.add(@questions[right_question_id].impact.scale(answer.question_result.to_i))
      vmax = vmax.add(@questions[right_question_id].impact.abs.scale(2))
     # to change if ranking goes higher than 2 and -2
    end
    Result.new(v, vmax)
  end

end
