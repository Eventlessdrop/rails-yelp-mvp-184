class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence: true
  # === The below line is commented out because I did not implement the means for the user to add a new rating with the review
  # but for all tense and purposes, it works
  # validates :rating, numericality: { only_integer: true }, inclusion: { in: (0..5) }
end
