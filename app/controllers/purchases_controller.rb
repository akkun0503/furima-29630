class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_item, only: [:index, :create]
  before_action :baria_purchase, only: [:index]

  def index
    @purchase_item = PurchaseItem.new
  end

  def create
    @purchase_item = PurchaseItem.new(purchase_item_params)
    if @purchase_item.valid?
      @purchase_item.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_item_params
    params.require(:purchase_item).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def baria_purchase
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
