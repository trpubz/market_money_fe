class MarketsController < ApplicationController
  def index
    # get markets from application controller
    @markets = app_markets
  end

  def show
    @market = app_market_facade.market(params[:id])
  end
end
