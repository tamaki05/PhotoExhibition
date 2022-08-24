class Public::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category_first_index  = @categories.first.id
  end

  def show
    @category = Category.find(params[:id])
    @exhibitions = @category.exhibitions
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
