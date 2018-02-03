require 'pry'
require "rails_helper"

feature "user views wing orders" do
  let(:honey_bbq_flavor) { Flavor.create(name: "Honey BBQ") }
  let(:sweet_chili_flavor) { Flavor.create(name: "Sweet Chili") }
  let(:wing_order) do
    WingOrder.create(
      customer_name: "Gene Parmesean",
      city: "Boston",
      state: "MA",
      quantity: 100,
      ranch_dressing: true
    )
  end
  let!(:order_first_flavor) { OrderFlavor.create(wing_order: wing_order, flavor: honey_bbq_flavor) }
  let!(:order_second_flavor) { OrderFlavor.create(wing_order: wing_order, flavor: sweet_chili_flavor) }

  scenario "edits an order" do
    visit 'wing_orders'
    click_on 'Edit Order'

    fill_in "Full Name", with: "Tony Peterson"
    fill_in "City", with: "Fort Wayne"
    select("Maine", from: "State")
    choose "50 wings"
    check "Add Ranch Dressing"
    check "Sweet Chili"
    click_button "Place Order"

    expect(page).to have_content("Tony Peterson")
    expect(page).to have_content("Fort Wayne")
    expect(page).to have_content("ME")
    expect(page).to have_content("50")
    expect(page).to have_content("Ranch")
    expect(page).to have_content("Sweet Chili")
  end
end
