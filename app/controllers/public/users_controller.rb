class Public::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
