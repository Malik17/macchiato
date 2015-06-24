class User < ActiveRecord::Base
  belongs_to :corporation
  has_many   :anwers

  validates :token, uniqueness: true
  validates :email, uniqueness: true
end
