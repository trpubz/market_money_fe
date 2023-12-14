class MarketFacade
  attr_reader :markets, :vendors
  def initialize
    data = Api::MarketService.markets[:data]
    @markets = data.map { |mrkt| Market.new(mrkt[:attributes]) }
    @vendors = []
  end

  # @abstract The market object will exist but most likely without the vendors.  Check the market#fetched_vendors?
  #   before making unnecessary API calls.
  def market(id)
    market = markets.find { |market| market.id == id }

    unless market.fetched_vendors?
      data = Api::MarketService.market_vendors(id)[:data]
      market.add_vendors(data)
      # add new vendors to the persisted vendors object
      market.vendors.each do |vendor|
        # require "byebug"; byebug
        unless vendors.any?(vendor)  # checks to see if the vendor object exists in collection before adding it
          vendors << vendor
        end
      end
    end

    market
  end
end
