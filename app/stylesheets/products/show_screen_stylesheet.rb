module Products

  class ShowScreenStylesheet < ApplicationStylesheet
    # Add your view stylesheets here. You can then override styles if needed,
    # example: include FooStylesheet
  
    def setup
      # Add stylesheet specific setup stuff here.
      # Add application specific setup stuff in application_stylesheet.rb
    end
  
    def root_view(st)
      st.background_color = color.white
    end
  
  
    def product_image(st)

      st.frame = { top: 200, left: 10 , width: 200, height: 200}
      st.background_color = color.black
    end
  
    def product_title(st)
      st.frame = { top: 100, left: 20, width: 100, height: 30}
      st.color = color.black
    end

    def shopping_cart_icon(st)  
    end
    
    def add_to_cart_icon(st)
    end

    def product_price(st)
      st.frame = { top: 420, left: 20, width: 100, height: 30}
      st.color = color.black
    end


    def favorite_icon(st)
      st.data = icon_image(:awesome, :heart_o, size: 20)
    end

  end
  

end