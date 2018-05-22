module NavigationHelper
  def nav_brand_path
    user_signed_in? ? todos_path : root_path
  end

  def guest_nav_items
    [
      {
        path: new_user_session_path,
        title: 'Sign in',
        can_view?: true,
      },
      {
        path: new_user_registration_path,
        title: 'Register',
        can_view?: true,
      },
    ]
  end

  def main_nav_items
    [
      {
        path:  users_path,
        title: 'Users',
      },
      {
        path:  todos_path,
        title: 'Todos',
      },
      {
        path: '#',
        title: current_user.email,
        children: [
          {
            path: edit_user_registration_path,
            title: 'Edit Profile',
          },
          {
            path: destroy_user_session_path,
            title: 'Sign out',
            method: :delete,
          },
        ]
      },
    ]
  end

  def current_nav_item_meta(nav_item)
    if active_path?(nav_item)
      '<span class="sr-only">(current)</span></a>'
    else
      nil
    end
  end

  def current_nav_item_class(nav_item)
    'active' if active_path?(nav_item)
  end

  def active_path?(nav_item)
    paths = [nav_item[:path]]
    paths += nav_item[:children].map {|c| c[:path] } if nav_item[:children]
    paths.find &self.method(:current_page?)
  end

  def sortable_link(model, column, title=nil)
    title ||= model.human_attribute_name(column)
    title = title.titleize if title != 'ID'
    order = if current_sort_column(model) == column.to_s &&
      current_sort_order == 'asc'
      "desc"
    else
      "asc"
    end
    css_class = 'sortable'
    css_class += " current #{order}" if current_sort_column(model) == column.to_s

    link_to title,
      params.permit(:from, :to, :priority).merge(
        sort: {
          column: column,
          order:  order
        }
      ),
      class: css_class
  end

  def current_sort_column(model)
    if params[:sort] && model.column_names.include?(params[:sort][:column])
      params[:sort][:column]
    else
      "created_at"
    end
  end

  def current_sort_order
    if params[:sort] && %w[asc desc].include?(params[:sort][:order])
      params[:sort][:order]
    else
      "asc"
    end
  end

end
