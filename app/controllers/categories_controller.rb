# app/controllers/categories_controller.rb

class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_category, only: [:show, :edit, :update, :destroy, :create_task]

  def index
    @categories = current_user.categories
  end

  def show
    # The set_category before_action already finds the category
    @task = Task.new
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
    # The set_category before_action already finds the category
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully deleted.'
  end

  def create_task
    @task = @category.tasks.new(task_params)

    if @task.save
      redirect_to @category, notice: 'Task was successfully created.'
    else
      render :show
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
