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
end
