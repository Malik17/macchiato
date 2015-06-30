class User < ActiveRecord::Base
  belongs_to :corporation
  has_many   :answers

  validates :token, uniqueness: true
  validates :email, uniqueness: true


  def has_finished_test?
    answers.count == Question.count
  end

end
