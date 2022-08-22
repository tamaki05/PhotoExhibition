class Public::UsersController < ApplicationController
  # ログインしていないユーザーはログイン画面にリダイレクトする
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_exhibitions = @user.exhibitions.all
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

  def exhibitions
    @user = User.find(params[:id])
    @exhibitions = @user.exhibitions.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :nickname, :profile, :extemal_link, :profile_image)
  end
end
