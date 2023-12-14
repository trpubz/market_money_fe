class ApplicationController < ActionController::Base

  def app_markets
    Rails.cache.fetch("markets") do
      MarketFacade.new.markets
    end
  end
end
