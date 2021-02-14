class HomesController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :move_to_registration, except: [:index]

  def index
    @memos = Memo.all.order(id: "DESC")
    @lists = List.all.order(id: "DESC")
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to home_path(@list.id)
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :explanation, :price, :image).merge(user_id: current_user.id)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def move_to_registration
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
