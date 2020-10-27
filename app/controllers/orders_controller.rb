class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseRecordShippingAddress.new
  end
  def create
    @purchase_address = PurchaseRecordShippingAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private
  def purchase_address_params
    params.require(:purchase_record_shipping_address).permit(:postal_code, :prefecture_id, :municipality, :address, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
     amount: Item.find(params[:item_id]).price,
     card: purchase_address_params[:token],
     currency:'jpy'
   )
  end
end