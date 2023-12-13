require "rails_helper"

describe "api market service" do
  it "connects to api and handles response", :vcr do
    markets_data = Api::MarketService.markets

    market1 = markets_data[:data][0]
    expect(markets_data[:status]).to eq 200
    expect(market1.keys).to include(:type, :attributes)
    expect(market1[:attributes].keys).to include(:id, :name)
  end
end
