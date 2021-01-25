class HomesController < ApplicationController
  def index
    @boards = Board.all.order(id: "DESC")
  end

  def create
  end

  def checked
    post = Board.find(params[:id])
    if post.checked 
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    memo = Board.find(params[:id])
    render json: { post: memo }
  end
end
