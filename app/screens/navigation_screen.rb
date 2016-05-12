class NavigationScreen < PM::TableScreen
  title "Your title here"
  stylesheet NavigationScreenStylesheet

  def table_data

    [{
      title: 'MENU',
      cells: [{
        title: sign_in_out_title ,
        action: :sign_in_out_button,
      }, {
       title: 'ZLAH',
        action: :swap_center_controller,
        arguments: HomeScreen       
      }
      ]
    }]
  end

  def sign_in_out_title
    if Auth.signed_in?
      "Logout"
    else
      "Sign In"
    end
  end

  def sign_in_out_button
    if Auth.signed_in?
      sign_out_button
    else
      sign_in_button
    end
  end

  def sign_in_button
    open SignInScreen
  end

  def sign_out_button
    Auth.sign_out do
      app.delegate.open_authenticated_root
    end
   end


  def swap_center_controller(screen_class)
    # Just use screen_class if you don't need a navigation bar
    app_delegate.menu.center_controller = screen_class
  end
  

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
end
