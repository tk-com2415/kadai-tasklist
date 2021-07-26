class tasksController < ApplicationController
  def index
    @tasks = task.all
  end

  def show
    @task = task.find(params[:id])
  end

  def new
    @task = task.new
  end

  def create
    @task = task.new(message_params)

    if @task.save
      flash[:success] = 'task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task が投稿されませんでした'
      render :new
    end
  end


  def edit
    @task = task.find(params[:id])
  end

  def update
    @task = task.find(params[:id])

    if @task.update(message_params)
      flash[:success] = 'task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task は更新されませんでした'
      render :edit
    end
  end


  def destroy
    @task = task.find(params[:id])
    @task.destroy

    flash[:success] = 'task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :title)
  end
  
end
