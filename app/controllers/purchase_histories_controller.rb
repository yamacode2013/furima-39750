class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :check_seller, only: [:new]

  def new
    @item = Item.find(params[:item_id])
    if @item.purchase_history.present?
      redirect_to root_path, alert: "This item has already been sold."
    else
      @purchase_shipping = PurchaseShipping.new
    end
  end

  def create 
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params) 
    if @purchase_shipping.valid?
      @purchase_shipping.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def check_seller
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user && @item.user == current_user
  end

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:post, :prefecture_id, :city, :street, :phone, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end