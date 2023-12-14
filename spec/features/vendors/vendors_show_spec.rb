require "rails_helper"

describe "vendor show page" do
  # As a visitor
  # When I visit a vendor's show page 'vendors/:id'
  # I see that vendor's name, contact information,
  # whether they accept credit, and a description of what they sell
  it "shows the vendors information", :vcr do
    # data = {
    #   id: "54924",
    #   attributes: {
    #     name: "CHZ PLZ",
    #     description: "This vendor offers a variety of artisanal cheeses.",
    #     contact_name: "Verna Goodwin Ret.",
    #     contact_phone: "595-100-6344",
    #     credit_accepted: true
    #   }
    # }
    #
    # allow(MarketFacade).to receive(:vendors).and_return([Vendor.new(data)])
    visit market_path("322474")
    click_link "CHZ PLZ"

    expect(page).to have_content "CHZ PLZ"
    expect(page).to have_content "Verna"
    expect(page).to have_content "6344"
    expect(page).to have_content "Credit Accepted?: YES"
    expect(page).to have_content "artisanal cheeses"
  end
end
