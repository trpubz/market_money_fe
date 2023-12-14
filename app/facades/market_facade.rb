class MarketFacade
  attr_reader :markets
  def initialize
    data = Api::MarketService.markets[:data]
    @markets = data.map { |mrkt| Market.new(mrkt[:attributes]) }
  end

  # @abstract The market object will exist but most likely without the vendors.  Check the market#fetched_vendors?
  #   before making unnecessary API calls.
  def market(id)
    market = markets.find{ |market| market.id == id }

    unless market.fetched_vendors?
      data = Api::MarketService.market_vendors(id)[:data]
      market.add_vendors(data)
      return market
    end
  end
end
