class HomeController < ApplicationController
  def index
    @employees = Employee.all
    @tasks = Task.all
    
    sortable_columns = %w[description status priority_id employee]
    sort_column = params[:sort].presence_in(sortable_columns) || "employee"
    sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"

    if sort_column == "employee"
      @tasks = Task.joins(:employee).order("employees.name #{sort_direction}")
    else
      @tasks = Task.order("#{sort_column} #{sort_direction}")
    end
    
  end
end
