class PurchasesController < ApplicationController
  def index
    @purchase_item = PurchaseItem.new
  end
  
  def create
  end
end
