class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  scope :of_user, -> (user) {where(user: user)}

  Result = Struct.new(:v, :vmax) do
    def angle
      @angle ||= Math.atan2(v.x,v.y)
    end

    def category
      pi = Math::PI
      if 0 < angle && angle <= pi/4
        category = 1
      elsif pi/4 < angle && angle <= pi/2
        category = 2
      elsif pi/2 < angle && angle <= 3*pi/4
        category = 3
      elsif 3*pi/4 < angle && angle <= pi
        category = 4
      elsif -pi < angle && angle <= -3*pi/4
        category = 5
      elsif -3*pi/4 < angle && angle <= -pi/2
        category = 6
      elsif -pi/2 < angle && angle <= -pi/4
        category = 7
      elsif -pi/4 < angle && angle <= 0
        category = 8
      else
        "oops"
      end

      if v.z >= 0
        category += 8
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
