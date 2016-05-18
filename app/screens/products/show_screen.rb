module Products
  class ShowScreen < PM::Screen
    stylesheet Products::ShowScreenStylesheet
  
    attr_accessor :product
  
    def on_load
  
      self.title = @product.title
      
      @layout = ProductShowLayout.new
      self.view = @layout.view
      @layout.add_constraints
  
      @title = @layout.get(:product_title)
      @title.text = @product.title
  
      @image = @layout.get(:product_image)
      @image.remote_image = product.image_url
  
  
      set_toolbar_items [{
          title: icon_image(:awesome, :plus, size: 20),
          action: :add_to_cart,
        }, {
          system_item: :flexible_space
        }, {
          title: icon_image(:awesome, :heart_o, size: 20) ,
          action: :some_other_action
      }]
  
      set_nav_bar_buttons :right, [{
        custom_view: my_custom_view_button,
        action: :nav_right_button
      }]

      mp MotionKeychain.get(:auth_token)
  
    #  set_nav_bar_button :right, title: icon_image(:awesome, :shopping_cart, size: 20) , action: :nav_right_button
    end
  
    def my_custom_view_button
      @shopping_car_icon ||= rmq.append(UIImageView, :shopping_cart_icon)
      @shopping_car_icon.data = icon_image(:awesome, :shopping_cart, size: 20)
    end
  
    def add_to_cart

      Product.add_to_cart(product.id) do |response, product_object|
        if response.success?
          app.alert("Success #{product.id}")
        else
          app.alert "Sorry, there was an error fetching the products."
          mp response.error.localizedDescription
        end
      end

    end
  
    def some_other_action
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


end