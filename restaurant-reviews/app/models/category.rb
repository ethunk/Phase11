class Category < ApplicationRecord
  CATEGORIES = ["Mexican", "Italian", "American", "Chinese"]
  validates :name, inclusion: { in: CATEGORIES }
  validates :name, presence: true
  has_many :categorizations
  has_many :restaurants, through: :categorizations
end
