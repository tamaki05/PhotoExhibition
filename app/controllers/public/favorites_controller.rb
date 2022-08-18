class Public::FavoritesController < ApplicationController

  def create
    @exhibition = Exhibition.find(params[:exhibition_id])
    favorite = current_user.favorites.new(exhibition_id: @exhibition.id)
    favorite.save
  end

  def destroy
    @exhibition = Exhibition.find(params[:exhibition_id])
    favorite = current_user.favorites.find_by(exhibition_id: @exhibition.id)
    favorite.destroy
  end
end
