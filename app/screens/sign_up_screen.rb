class SignUpScreen < PM::XLFormScreen
  title "Sign Up"
  stylesheet SignUpScreenStylesheet

  def form_data
    [
      {
        cells: [
          {
            title:       'Email',
            name:        :email,
            type:        :email,
            placeholder: 'Enter your email',
            required:    true
          },
          {
            title:       'Password',
            name:        :password,
            type:        :password,
            placeholder: 'Enter your password',
            required:    true
          },
          {
            title:       'Password Again',
            name:        :password_confirmation,
            type:        :password,
            placeholder: 'Enter your password again',
            required:    true
          },

          {
            title: 'Sign Up',
            name: :save,
            type: :button,
            on_click: -> (cell) {
              sign_up
            }
          }
        ]
      }
    ]
  end

  def sign_up
    Auth.sign_up(email: values["email"], password: values["password"], password_confirmation: values["password_confirmation"]) do |response|
      if response.success?
        ApiClient.update_authorization_header(Auth.authorization_header)
        app.delegate.open_authenticated_root
      elsif response.object
        puts response.object
        app.alert "#{response.object['error']['message']} (#{response.object['error']['code']})"
      else
        app.alert "Sorry, there was an error. #{response.error.localizedDescription}"
      end
    end
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
