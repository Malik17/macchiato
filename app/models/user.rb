class User < ActiveRecord::Base
  belongs_to :corporation
  validates :token, uniqueness: true
  validates :email, uniqueness: true
end
