module TasksHelper
    def tasks_sortable_link(title, column)
        direction = (params[:sort] == column && params[:direction] == "asc") ? "desc" : "asc"
        link_to title, request.params.merge(sort: column, direction: direction, format: nil), class: "text-white"
    end
end
