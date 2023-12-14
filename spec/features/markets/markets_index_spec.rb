require "rails_helper"

describe "index page" do
  before(:each) do
    @mock_markets = {
      data: [
        {
          attributes: {
            id: "322458",
            name: "14&U Farmers' Market",
            street: "1400 U Street NW ",
            city: "Washington",
            county: "District of Columbia",
            state: "District of Columbia"
          }
        },
        {
          attributes: {
            id: "322474",
            name: "2nd Street Farmers' Market",
            street: "194 second street",
            city: "Amherst",
            county: "Amherst",
            state: "Virginia"
          }
        }
      ]
    }

    allow(Api::MarketService).to receive(:markets).and_return @mock_markets
  end
  # As a visitor,
  # When I visit '/markets'
  # I see all markets listed with their name, city and state
  # When I click a button to see more info on that market
  # I'm taken to that market's show page '/markets/:id'
  it "shows all markets" do
    visit markets_path

    @mock_markets[:data].each do |mrkt |
      within("#mrkt-#{mrkt[:attributes][:id]}") do
        expect(page).to have_content mrkt[:attributes][:name]
        expect(page).to have_content mrkt[:attributes][:city]
        expect(page).to have_content mrkt[:attributes][:state]
        expect(page).to have_button("More Info")
      end
    end
  end
end
