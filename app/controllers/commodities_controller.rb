class CommoditiesController < ApplicationController
  def index
    @commodities = Commodity.all.order(id: "DESC")
  end

  def new
    @commodity = Commodity.new
  end
end
