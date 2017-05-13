class CategoriesController < ApplicationController
  before_action :fetch_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.valid? ? create_category : handle_post_validation_failed
  end

  def show; end

  def edit; end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    redirect_to @category
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy!
    flash[:notice] = "Category #{@category.name} deleted"
    redirect_to categories_path
  end

  private

  def create_category
    flash[:notice] = 'Category created!'
    redirect_to @category
  end

  def handle_post_validation_failed
    flash['errors'] = @category.errors.full_messages
    redirect_back(fallback_location: root_path)
  end

  def fetch_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
