require 'rails_helper'
# As a user
# I want to see the categories that a restaurant belongs to
# So that I know the different kinds of cuisine that the restaurant serves
#
# [x] On the page for a restaurants details, I should see all the categories that a restaurant belongs to.
# [x] Clicking on the name of a category should take me to the page with the list of all the restaurants for that particular category.

feature 'visitors can view all the categories for a restaurant' do
  scenario "visitor clicks a restaurant detail page and sees all the categories for that restaurant" do

    RestaurantSeeder.seed!
    CategorySeeder.seed!
    CategorizationSeeder.seed!

    visit restaurants_path
    click_link(Restaurant.last.name)
    Restaurant.last.categories.each do |category|
      expect(page).to have_content(category.name)
    end
  end
end
