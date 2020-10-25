class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end
  # def updata
    
  # end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :delivery_cost_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
