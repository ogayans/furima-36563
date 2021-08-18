class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]
  before_action :sold_out_item, only: [:index]

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pry_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number,:item_id).merge(user_id: current_user.id).merge(token: params[:token])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pry_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: buy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_index
    unless current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def sold_out_item
    redirect_to root_path if @item.buy.present?
  end

end