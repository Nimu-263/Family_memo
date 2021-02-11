class HomesController < ApplicationController
  before_action :move_to_registration, except: [:index, :create]

  def index
    @memos = Memo.all.order(id: "DESC")
    @lists = List.all.order(id: "DESC")
  end

  def new
    @list = List.new
  end

  def list_create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
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

  private

  def list_params
    params.require(:list).permit(:name, :explanation, :price).merge(user_id: current_user.id)
  end

  def move_to_registration
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
