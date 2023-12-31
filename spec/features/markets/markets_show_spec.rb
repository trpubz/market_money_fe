require "rails_helper"

describe "market show page" do
  # As a visitor,
  # When I visit a market's show page 'markets/:id'
  # I see that market's name and readable address
  # And I also see a list of all the Vendors that are at that market
  # Each vendor name is a link to that vendor's show page
  it "shows the market's address and vendors", :vcr do
    visit market_path("322474")

    expect(page).to have_content "2nd Street Farmers' Market"
    expect(page).to have_content "Virginia"
    expect(page).to have_link "Orange County Olive Oil"
  end
end
