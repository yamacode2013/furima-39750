class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:new, :create, :check_seller, :pay_item]
  before_action :check_seller, only: [:new]

  def new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    if @item.purchase_history.present?
      redirect_to root_path, alert: "This item has already been sold."
    else
      @purchase_shipping = PurchaseShipping.new
    end
  end

  def create 
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params) 
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_seller
    redirect_to root_path if current_user && @item.user == current_user
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: purchase_shipping_params[:token],  
        currency: 'jpy' 
    )
  end

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:post, :prefecture_id, :city, :street, :phone, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end