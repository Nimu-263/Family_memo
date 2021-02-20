class CommoditiesController < ApplicationController
  def index
    @commodities = Commodity.all.order(id: "DESC")
  end
end
