class Question < ActiveRecord::Base

  has_many :answers

  def impact
    Vector.new(x_impact, y_impact, z_impact)
  end

  scope :not_answered_by, -> (user) {where.not(id: Answer.of_user(user).select(:question_id))}

end
