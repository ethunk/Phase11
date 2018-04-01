require 'rails_helper'
# As a user
# I want to see the restaurants belonging to a category
# So that I can pick a restaurant for a specific category
#
# [x] I should see the name of the category at the top of the page.
# [x] I should see the name of all restaurants that belong to this category.
# [x] I should be taken to restaurant's details page if I click on the name of a restaurant while on this page.
# [x] I should get to this page by clicking on the name of a category while on the page with the names of all the categories.

feature 'visitors can view all the restaurants in category' do
  scenario 'visitor clicks a category and sees all restaurants in that category' do

    RestaurantSeeder.seed!
    CategorySeeder.seed!
    CategorizationSeeder.seed!
    visit restaurants_path
    click_link('Categories')

    click_link(Restaurant.first.categories[0].name)
    expect(page).to have_content(Restaurant.first.name)

    visit restaurants_path
    click_link 'Categories'
    click_link 'Mexican'

  end
end
