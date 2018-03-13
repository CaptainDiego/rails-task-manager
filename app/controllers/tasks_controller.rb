class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(check_params)
    @task.save
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(check_params)
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.detroy
  end

  private

  def check_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
