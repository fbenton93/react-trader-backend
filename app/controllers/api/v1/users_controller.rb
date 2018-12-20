class Api::V1::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed' }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user)}, status: :accepted
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end


end
