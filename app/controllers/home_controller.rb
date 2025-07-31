class HomeController < ApplicationController
  def index
    @employees = Employee.all
    @tasks_scope = Task.all
    @priorities = Priority.all

    if params[:employee_name].present?
      @tasks_scope = @tasks_scope.joins(:employee).where("LOWER(employees.name) LIKE ?", "%#{params[:employee_name].downcase}%")

    end

    if params[:status].present? && params[:status] != "all"
      status_value = params[:status].downcase == "completed"
      @tasks_scope = @tasks_scope.where(status: status_value)
    end

    if params[:priority_description].present?
      @tasks_scope = @tasks_scope.joins(:priority)
      .where("LOWER(priorities.description) LIKE ?", "%#{params[:priority_description].downcase}%")
    end
    
    sortable_columns = %w[description status priority employee]
    sort_column = params[:sort].presence_in(sortable_columns) || "employee"
    sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"

    case sort_column
      when "employee"
        @tasks_scope = @tasks_scope.joins(:employee).order("employees.name #{sort_direction}")
      when "priority"
        @tasks_scope = @tasks_scope.joins(:priority).order("priorities.description #{sort_direction}")
      else
        @tasks_scope = @tasks_scope.order("#{sort_column} #{sort_direction}")
      end

      @tasks = @tasks_scope

    end
end
