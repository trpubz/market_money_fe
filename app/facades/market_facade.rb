class MarketFacade
  attr_reader :markets
  def initialize
    data = Api::MarketService.markets[:data]
    @markets = data.map { |mrkt| Market.new(mrkt[:attributes]) }
  end
end
