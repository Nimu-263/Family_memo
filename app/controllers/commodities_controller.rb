class CommoditiesController < ApplicationController
  before_action :move_to_registration

  def index
    @commodities = Commodity.all.order(id: "DESC")
  end

  def new
    @commodity = Commodity.new
  end

  def create
    @commodity = Commodity.new(commodity_params)
    if @commodity.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def commodity_params
    params.require(:commodity).permit(:image, :name, :price, :quantity, :storage_location, :purchase_shop, :purchase_day, :explanation).merge(user_id: current_user.id)
  end

  def move_to_registration
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
