class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  def comments
    @user = User.find(params[:id])
    # comments = Comment.where(user_id: @user.id).pluck(:exhibition_id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end
