class Public::HomesController < ApplicationController
  def top
  end

  def about
    @exhibition = Exhibition.limit(3)
  end
end
