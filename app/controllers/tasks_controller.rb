class TasksController < ApplicationController
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
  def edit
    @task = Task.find(params[:id])
  end
  def update
    task = Task.find(params[:id])
    task.update(task_params)

    redirect_to task_path(task)
  end
  def destroy
    task = Task.find(params[:id])
    task.destroy

    redirect_to tasks_path
  end
  def mark_complete
    task = Task.find(params[:format])
    task.completed ? task.update({completed: false}): task.update({completed: true})

    redirect_to task_path(task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
