require "rails_helper"

describe MarketFacade do
  it "autoloads markets when initialized" do
    VCR.use_cassette("all markets") do
      mrkt_facade = MarketFacade.new

      expect(mrkt_facade.markets).to be_an Array
      expect(mrkt_facade.markets.first).to be_a Market
    end
  end

  describe "#market" do
    it "returns a market object and fetches vendors if it hasn't happened yet", :vcr do
      mrkt_facade = VCR.use_cassette("all markets") do
        MarketFacade.new
      end

      expect(mrkt_facade.markets.first.fetched_vendors?).to eq false

      mrkt = mrkt_facade.market("322474")
      expect(mrkt.fetched_vendors?).to eq true
      expect(mrkt.vendors.first).to be_a Vendor
    end
  end
end
