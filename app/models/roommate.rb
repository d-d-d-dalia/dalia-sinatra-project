class Roommate < ActiveRecord::Base
  has_many :chores
  has_secure_password
end
