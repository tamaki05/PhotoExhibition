class Public::ExhibitionsController < ApplicationController
  # ログインしていないユーザーはログイン画面にリダイレクトする
  before_action :authenticate_user!, except: [:ranking]

  def index
    @user = current_user
    @exhibition = @user.exhibitions.all
  end

  def show
    @exhibition = Exhibition.find(params[:id])
    @user = @exhibition.user
  end

  def new
    @exhibition = Exhibition.new
    # @categories = Category.all
  end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    @exhibition.user_id = current_user.id
    if @exhibition.save
      redirect_to exhibitions_path
    else
      render :new
    end
  end

  def edit
    @exhibition = Exhibition.find(params[:id])
  end

  def update
    exhibition = Exhibition.find(params[:id])
    exhibition.update(exhibition_params)
    redirect_to exhibition_path(exhibition.id)
  end

  def destroy
    exhibition = Exhibition.find(params[:id])
    exhibition.destroy
    redirect_to exhibitions_path
  end

  def comments
    @comment = Comment.new
    @exhibition = Exhibition.find(params[:id])
    comments = Comment.where(exhibition_id: @exhibition.id).pluck(:user_id)
    @comment_users = User.find(comments)
  end

  def ranking
    @exhibition = Exhibition.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end

  # 検索(ransack)
  def search
    @results = @q.result
  end

  private


  def exhibition_params
    params.require(:exhibition).permit(:image, :title, :introduction, :category_id)
  end
end
