class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    @complete = @task.completed ? 'This task is completed 🙂' : 'This task is not completed 🙁'
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task)
    else
      render 'new.html.erb'
    end
  end

  def edit; end

  def update
    @task = Task.update(task_params)
    if @task.update
      redirect_to task_path(@task)
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
