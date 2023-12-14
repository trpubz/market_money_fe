class MarketFacade
  attr_reader :markets
  def initialize
    data = Api::MarketService.markets[:data]
    @markets = data.map { |mrkt| Market.new(mrkt[:attributes]) }
  end

  def market(id)
    data = Api::MarketService.market_vendors[:data]
    market = markets.filter { |market| market.id == id }

    market.add_vendors(data)
  end
end
