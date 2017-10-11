class Roommate < ActiveRecord::Base
  has_many :chores
  belongs_to :household
  has_secure_password
  validates :name, uniqueness: {:scope => :household}
end
