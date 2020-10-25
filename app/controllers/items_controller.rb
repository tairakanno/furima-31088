class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_params, only: [:show, :edit, :update, :destroy]
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
  end
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end
  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :delivery_cost_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
  def find_params
    @item = Item.find(params[:id])
  end
end
