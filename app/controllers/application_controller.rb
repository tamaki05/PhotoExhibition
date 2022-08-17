class ApplicationController < ActionController::Base
  # 検索用
  before_action :set_q

  # 検索(ransack)
  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Exhibition.ransack(params[:q])
  end

end
