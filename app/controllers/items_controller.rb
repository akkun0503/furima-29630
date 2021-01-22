class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :find_item, only: [:show, :edit, :update]
  before_action :baria_item, only: [:edit, :update]

  def index
    @items = Item.all.order("id DESC").includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def baria_item
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end

end