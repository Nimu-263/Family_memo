class StocksController < ApplicationController
  def commodity
    ＠commodities = Commodity.all.order(id: "DESC")
  end
end
