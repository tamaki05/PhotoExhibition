class ApplicationController < ActionController::Base
  # # 検索用
  # before_action :set_search

  # def set_search
  #   @search = Exhibition.ransack(params[:q])
  #   @search_exhibitions = @search.result.page(params[:page])
  # end

end
