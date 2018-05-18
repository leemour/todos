module ApplicationHelper
  def app_name
    'Todos'
  end

  def title(text)
    text.present? ? text : base_title
  end

  def base_title
    "Todo list"
  end

  def description(text)
    text.present? ? text : base_description
  end

  def base_description
    "Todo list"
  end

  def keywords(text)
    text.present? ? text : ''
  end

  def body_class(text="")
    ["#{controller_name}-page", action_name, text]
  end
end
