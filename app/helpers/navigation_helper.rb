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
end
