class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @books = @category.books
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Added Category"
      redirect_to categories_path
    else
      flash[:info] = "Failed Add Category"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Updated category"
      redirect_to categories_path
    else
      flash[:info] = "Failed Update Category"
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:danger] = "Destroyed Category"
    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
