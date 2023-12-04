# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
    before_action :set_category
    before_action :set_task, only: [:edit, :update, :destroy]
  
    def index
        @tasks = @category.tasks
      end
  
    def create
        puts "Params received: #{params.inspect}" # Debugging line
        @task = @category.tasks.build(task_params)
      
        if @task.save
          redirect_to category_path(@category), notice: 'Task was successfully created.'
        else
          render :new
        end
      end
    
      def show
        @task = @category.tasks.find(params[:id])
      end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to category_path(@category), notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to category_path(@category), notice: 'Task was successfully deleted.'
    end
  
    private
  
    def set_category
      @category = Category.find(params[:category_id])
    end
  
    def set_task
      @task = @category.tasks.find(params[:id])
    end
  
    def task_params
        params.require(:task).permit(:name, :description)
      end
  end
  