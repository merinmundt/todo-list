class HomeController < ApplicationController
  def index
    @employees = Employee.all
    @tasks = Task.all
  end
end
