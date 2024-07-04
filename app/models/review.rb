class Review < ApplicationRecord
  belongs_to :movie

  validates :reviewer, presence: true
  validates :stars, numericality: { in: 1..5,  only_integer: true }
end
