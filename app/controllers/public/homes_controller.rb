class Public::HomesController < ApplicationController
  def top
  end

  def about
    @exhibition = Exhibition.all
    @exhibition = Exhibition.all.order(created_at: :desc)
  end
end
