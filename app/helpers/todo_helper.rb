module TodoHelper
  def due_at_display(todo_item)
    if todo_item.due_at.present?
      todo_item.due_at.strftime('%d.%m.%Y <br> %H:%M')
    else
      '<p>Due at</p>'
    end.html_safe
  end

  def datetime_from_param(value)
    value.present? && Time.parse(value).strftime('%d.%m.%Y %H:%M')
  end
end
