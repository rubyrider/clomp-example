class Post < ApplicationRecord
  validates :title, presence: true
  
  scope :minimum_points, -> { minimum(:point) }
end
