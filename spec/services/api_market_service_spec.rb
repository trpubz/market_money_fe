require "rails_helper"

describe "api market service" do
  it "connects to api and handles response for markets", :vcr do
    markets_data = Api::MarketService.markets

    market1 = markets_data[:data][0]
    expect(markets_data[:status]).to eq 200
    expect(market1.keys).to include(:type, :attributes)
    expect(market1[:attributes].keys).to include(:id, :name)
  end

  it "connects to api and handles response for market vendors", :vcr do
    market_vendor_data = Api::MarketService.market_vendors("322474")

    market_vendor1 = market_vendor_data[:data][0]
    expect(market_vendor_data[:status]).to eq 200
    expect(market_vendor1.keys).to include(:type, :attributes, :id)
    expect(market_vendor1[:attributes].keys).to include(:description, :name)
  end
end
