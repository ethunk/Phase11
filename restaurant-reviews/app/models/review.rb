class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :body, presence: true
  validates :rating, presence: true
end



RATINGS = [
  ['Choose a Rating',0],
  ['1 - Not Good',1],
  ["2",2],
  ['3 - Avg',3],
  ['4',4],
  ['5 - Best',5]
  ]
