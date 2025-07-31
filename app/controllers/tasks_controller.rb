class TasksController < ApplicationController
  def new
    @task = Task.new
    @employees = Employee.all
    @priorities = Priority.all  
  end

  def create
    @task = Task.new(task_params)
    if(@task.save)
      redirect_to @task, notice: "Task created successfully."
    else 
      puts "Error saving task:"
      puts @task.errors.full_messages.join(",")

      @employees = Employee.all
      @priorities = Priority.all
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      respond_to do |format|
        format.js 
        format.json {render json: { status: @task.status }}
        format.html { redirect_to root_path, notice: "Task Updated Successfully"}
      end
    else 
      respond_to do |format|
        format.js { head :unprocessable_entity}
        format.json {render json: @task.errors, status: :unprocessable_entity}
        format.html { render :edit}  
      end
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private 
  def task_params
    params.require(:task).permit(:employee_id, :description, :priority_id, :status)
  end
end
