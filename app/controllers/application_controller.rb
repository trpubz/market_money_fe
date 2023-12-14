class ApplicationController < ActionController::Base

  def app_market_facade
    mf = Rails.cache.read("market_facade")
    # require "byebug"; byebug
    Rails.logger.debug "Cache for market facade?: #{!mf.nil?}"

    if mf.nil?
      mf = MarketFacade.new
      Rails.cache.write("market_facade", mf)
    end

    mf
  end
end
