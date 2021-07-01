class Chore < ActiveRecord::Base
  belongs_to :roommate
  validates :name, presence: true
end