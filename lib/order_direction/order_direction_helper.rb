module OrderDirectionHelper
  
  def sortable_direction(column, title = nil)
    title ||= column.titleize
    direction = (column.to_s == sort_column && sort_direction == "asc") ? "desc" : "asc"
    html = ""
    html << link_to(title, params.merge(:sort => column, :direction => direction))
    html << " <i class='icon-arrow-#{direction == 'desc' ? 'down' : 'up'}'></i>"
    html.html_safe
  end
  
end