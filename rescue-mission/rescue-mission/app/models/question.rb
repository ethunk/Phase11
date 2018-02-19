class Question < ApplicationRecord
  has_many :answers
  # has_one :best_answer
  # belongs_to :user
  validates :title,
    presence: true,
    length: { minimum: 20, maximum: 120 }
  validates :description,
    presence: true,
    length: { minimum: 50 }
end
