class HomesController < ApplicationController
  def index
    @memos = Memo.all.order(id: "DESC")
  end

  def create
    memo = Memo.create(title: params[:title], content: params[:content], checked: false)
    render json:{ memo: memo }
  end

  def checked
    memo = Memo.find(params[:id])
    if memo.checked 
      memo.update(checked: false)
    else
      memo.update(checked: true)
    end

    item = Memo.find(params[:id])
    render json: { memo: item }
  end
end
