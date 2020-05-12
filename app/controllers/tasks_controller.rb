class TasksController < ApplicationController
  def task_params
    params.require(:task).permit(:title, :details)
  end
  def new
    @task = Task.new
  end
  def create
    new_task = Task.create(task_params)
    redirect_to task_path(new_task)
  end
  def index
    @tasks = Task.all
  end
  def show
    @task = Task.find(params[:id])
  end
end
