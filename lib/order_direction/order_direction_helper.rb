require "action_view"

module OrderDirectionHelper
  
  def sortable_direction(column, title = nil)
    title ||= column.titleize
    direction = %w(asc desc).include?(params[:direction]) ? params[:direction] : "desc"
    direction = (direction == "asc") ? "desc" : "asc"
    html << link_to(title, params.merge(:sort => column, :direction => direction))
    html << " <i class='icon-arrow-#{direction == 'desc' ? 'down' : 'up'}'></i>"
    html.html_safe
  end
  
end