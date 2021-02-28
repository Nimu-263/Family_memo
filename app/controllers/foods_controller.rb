class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :move_to_registration

  def index
    @foods = Food.all.order(id: "DESC")
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to "/foods"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to food_path(@food.id)
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to "/foods"
  end

  private

  def food_params
    params.require(:food).permit(:image, :name, :price, :quantity, :storage_location, :purchase_shop, :purchase_day, :expiration_date, :explanation).merge(user_id: current_user.id)
  end

  def set_commodity
    @food = Food.find(params[:id])
  end

  def move_to_registration
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
