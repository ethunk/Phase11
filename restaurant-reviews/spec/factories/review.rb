FactoryBot.define do
  factory :review do
    restaurant_id '1'
    rating '4'
    body 'This is the perfect place for a first date.'

    user
    restaurant
  end
end
