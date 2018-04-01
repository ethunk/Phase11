FactoryBot.define do
  factory :restaurant do
    sequence(:name) {|n| "Restaurant #{n}" }
    user_id '1'
    name "Fazoli's"
    address '100 Center Drive'
    city 'Cambridge'
    state 'MA'
    zip '02345'
    description 'Free Breadsticks with each entree'

    user
  end
end
