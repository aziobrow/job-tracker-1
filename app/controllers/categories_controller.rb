class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.title} was successfully deleted!"
    redirect_to categories_path
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Category.find(params[:id])
    @company.update(category_params)

    if @company.save
      flash[:success] = "#{@category.name} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end


  def category_params
    params.require(:category).permit(:title)
  end

end
