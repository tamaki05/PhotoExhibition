class ApplicationController < ActionController::Base
  # 検索用
  before_action :set_q, only: [:index, :search]

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Exhibition.ransack(params[:q])
  end

end
