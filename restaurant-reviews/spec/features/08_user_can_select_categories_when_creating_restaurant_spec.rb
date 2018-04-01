require 'rails_helper'
# As a user
# I want to specify what categories a restaurant belongs to when creating it
# So people know what kind of cuisine the new restaurant serves
#
# [ ] On the page to create a new restaurant, I should see checkboxes for all the categories.
# [ ] Upon successful form submission, I should see the names of the categories which were selected on the form to be present on the restaurant's details page.


feature 'users can select categories when creating a restuarant' do
  scenario 'visitor creates restaurant and selects categories' do
    CategorySeeder.seed!
    visit new_restaurant_path

    fill_in 'Name', with: "Di Bruno Bros"
    fill_in 'Address', with: "930 S 9th St"
    fill_in 'City', with: "Philadel"
    fill_in 'State', with: "Pennsylvania"
    fill_in 'Zip', with: "19147"
    fill_in 'Description', with: "This old-school-style Italian deli serves breakfast fare & a range of sandwiches, roll-ups & salads."

    category_one = Category.first
    category_last = Category.last

    find(:css, "#restaurant_categorizations_#{category_one.id}").set(true)
    find(:css, "#restaurant_categorizations_#{category_last.id}").set(true)

    click_on('Add Restaurant')

    expect(page).to have_content('Di Bruno Bros')
    click_on('Di Bruno Bros')

    expect(page).to have_content('Mexican')
    expect(page).to have_content('Chinese')

  end
end
