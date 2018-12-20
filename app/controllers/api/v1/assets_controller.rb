class Api::V1::AssetsController < ApplicationController

  def create
    @asset = Asset.new(asset_params)
    @asset.user_id = current_user.id
    @user = current_user
    if @asset.save
      cost = @asset.price * @asset.quantity
      new_balance = @user.balance - cost
      @user.update(balance: new_balance)
      render json: { user: UserSerializer.new(@user) }
    else
      render json: { message: 'invalid purchase' }, status: :bad_request
    end
  end

  def update
    @asset = Asset.find(asset_params[:id])
    @user = User.find(@asset.user_id)
    cash = asset_params[:quantity].to_i * asset_params[:price].to_i
    @user.balance += cash
    @user.save
    if @asset.quantity == asset_params[:quantity].to_i
      @asset.update(open: false)
    else
      @asset.quantity -= asset_params[:quantity].to_i
      @asset.save
    end

    render json: { user: UserSerializer.new(@user) }

  end

  private

  def asset_params
    params.require(:asset).permit(:ticker,:name,:price,:quantity,:user_id,:id)
  end

end
