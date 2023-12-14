class MarketsController < ApplicationController
  def index
    # get markets from application controller
    @markets = app_markets
  end

  def show

  end
end
