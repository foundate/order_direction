require "action_view"

module OrderDirectionHelper
  
  def sortable_direction(column, title = nil)
    title ||= column.titleize
    direction = %w(asc desc).include?(params[:direction]) ? params[:direction] : "desc"
    direction = (column.to_s == params[:sort] && direction == "asc") ? "desc" : "asc"
    html = ""
    html << link_to(title, params.merge(:sort => column, :direction => direction))
    html << " <i class='icon-arrow-#{direction == 'desc' ? 'down' : 'up'}'></i>"
    html.html_safe
  end

end