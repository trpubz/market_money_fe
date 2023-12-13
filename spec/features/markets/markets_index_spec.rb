require "rails_helper"

describe "index page" do
  # As a visitor,
  # When I visit '/markets'
  # I see all markets listed with their name, city and state
  # When I click a button to see more info on that market
  # I'm taken to that market's show page '/markets/:id'
  it "shows all markets" do
    visit markets_path


  end
end
