class Public::HomesController < ApplicationController
  def top
    @exhibition = Exhibition.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end

  def about
    @exhibition = Exhibition.all
    @exhibition = Exhibition.all.order(created_at: :desc)
  end
end
