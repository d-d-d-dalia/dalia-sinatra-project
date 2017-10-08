class Chore < ActiveRecord::Base
  belongs_to :roommate
  # has_many :roommates through: :chores
end
