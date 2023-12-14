class VendorsController < ApplicationController
  def show
    # require "byebug"; byebug
    @vendor = app_market_facade.vendors.find { |vndr| vndr.id == params[:id] }
  end
end
