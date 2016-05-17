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
  
    def root_view(st)
      st.background_color = color.white
    end
  
  
    def product_title(st)
      st.frame = {top: 10, width: device_width - 40, height: 0, left: 20}
      st.color = color.battleship_gray
      st.view.lineBreakMode = UILineBreakModeWordWrap
      st.view.numberOfLines = 0
      st.view.sizeToFit
    end
  
  end
  

end