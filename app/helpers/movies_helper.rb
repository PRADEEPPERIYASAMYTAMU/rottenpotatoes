module MoviesHelper
    def sortable_header(column, title)
      # Determine the next sort direction
      new_direction = (column.to_s == @sort_by && @direction == 'asc') ? 'desc' : 'asc'
      
      # Check if this is the currently sorted column
      css_class = (column.to_s == @sort_by) ? "hilite" : nil
      
      # Determine the visual indicator arrow
      indicator = (column.to_s == @sort_by) ? (@direction == 'asc' ? '▲' : '▼') : ''
      
      # Use the content_tag helper to build the <th> element
      content_tag(:th, class: css_class) do
        link_to("#{title} #{indicator}".html_safe, movies_path(sort_by: column, direction: new_direction))
      end
    end
  end
  