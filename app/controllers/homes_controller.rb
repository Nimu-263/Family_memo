class HomesController < ApplicationController
  def index
    @boards = Board.all.order(id: "DESC")
  end
end
