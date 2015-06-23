class Corporation < ActiveRecord::Base
  has_many :users

  validates :token, uniqueness: true
  validates :email, uniqueness: true
end
