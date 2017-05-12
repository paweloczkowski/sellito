class CategoriesController < ApplicationController
  before_action :fetch_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

 def new
   @category = Category.new
 end

 def create
   @category = Category.new(category_params)
   if @category.save
   flash[:notice] = 'Category created!'
   redirect_to @category
  else
    flash[:alert] = 'Could not create category'
    redirect_back(fallback_location: root_path)
  end
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

 def fetch_category
   @category = Category.find(params[:id])
 end
end
