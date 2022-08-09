class Public::UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:exhibition_id)
    @favorite_exhibitions = Exhibition.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :nickname, :profile, :extemal_link)
  end
end
