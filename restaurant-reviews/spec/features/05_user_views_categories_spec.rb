require 'rails_helper'
# As a user
# I want to see categories of restaurants (e.g. *thai*, *italian*, *chinese*)
# So that I can see the different kinds of foods I could eat
#
# [x] I should see the name of all categories.
# [x] I should get to this page by clicking on a "Categories" link which is located on the header of every page.

feature 'visitors can view all the categories' do
  scenario 'visitor clicks categories link at top of pages' do
    RestaurantSeeder.seed!
    CategorySeeder.seed!
    CategorizationSeeder.seed!

    visit restaurants_path
    click_link 'Categories'

    visit new_restaurant_review_path(Restaurant.first)
    click_link "Categories"

    expect(page).to have_content('American')
    expect(page).to have_content('Italian')
    expect(page).to have_content('Chinese')
    expect(page).to have_content('Mexican')

  end
end
