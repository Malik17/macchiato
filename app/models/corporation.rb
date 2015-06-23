class Corporation < ActiveRecord::Base
  has_many :users

  validates :token,         uniqueness: true
  # only reactivate this at the end of test
  # validates :email, uniqueness: true
  validates :email,         presence: true
  validates :contact_first, presence: true
  validates :contact_last,  presence: true
  validates :name,          presence: true
  validates :division,      presence: true

end
