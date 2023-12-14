class ApplicationController < ActionController::Base

  def app_markets
    markets = Rails.cache.read("markets")
    Rails.logger.debug "Cache for markets?: #{!markets.nil?}"

    if markets.nil?
      markets = app_market_facade.markets
      Rails.cache.write("markets", markets)
    end

    markets
  end

  def app_market_facade
    mf = Rails.cache.read("market_facade")
    Rails.logger.debug "Cache for market facade?: #{!mf.nil?}"

    if mf.nil?
      mf = MarketFacade.new
      Rails.cache.write("market_facade", mf)
    end

    mf
  end
end
