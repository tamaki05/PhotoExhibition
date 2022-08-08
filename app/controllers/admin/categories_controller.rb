class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path
  end

  def destroy
    @categories =Category.find(params[:id])
    @categories.destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
