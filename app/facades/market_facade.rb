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
    # require "byebug"; byebug
    unless market.fetched_vendors?
      data = Api::MarketService.market_vendors(id)[:data]
      market.add_vendors(data)
      # add new vendors to the persisted vendors object
      market.vendors.each do |vendor|
        unless vendors.any?(vendor)  # checks to see if the vendor object exists in collection before adding it
          vendors << vendor
        end
      end
      # need to persist these changes to the cache
      Rails.cache.write("market_facade", self, expires_in: 48.hours)
    end

    market
  end
end
