class PrioritiesController < ApplicationController
    def index
        @priorities = Priority.all
    end 

    def new
        @priority = Priority.new
    end

    def create
        @priority = Priority.new(priority_params)
        if @priority.save
            redirect_to priorities_path, notice: "Priority created successfully."
        else
            render :new
        end
    end

    def destroy
        @priority = Priority.find(params[:id])
        @priority.destroy
        redirect_to priorities_path, notice: "Priority was successfully deleted."
    end

    private

    def priority_params
        params.require(:priority).permit(:description)
    end

end
