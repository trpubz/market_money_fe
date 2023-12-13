require "rails_helper"

describe MarketFacade do
  it "autoloads markets when initialized", :vcr do
    mrkt_facade = MarketFacade.new

    expect(mrkt_facade.markets).to be_an Array
    expect(mrkt_facade.markets.first).to be_a Market
  end
end
