class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
    respond_to do |format|
      format.html { render :index, formats: [:html] }
      format.json { render json: @employees }
    end

  end

  def new
    @employee = Employee.new
  end

  def create 
    @employee = Employee.new(employee_params)
    if(@employee.save)
      redirect_to @employee, notice: "Employee created successfully."
    else 
      render :new
    end
  end
  def show
    @employee = Employee.find(params[:id])
  end

  private 
  def employee_params
    params.require(:employee).permit(:name, :role)
  end

end
