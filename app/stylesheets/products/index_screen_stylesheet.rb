module Products

  class IndexScreenStylesheet < ApplicationStylesheet
    # Add your view stylesheets here. You can then override styles if needed,
    # example: include FooStylesheet
  
    def setup
      # Add stylesheet specific setup stuff here.
      # Add application specific setup stuff in application_stylesheet.rb
    end
  
    def root_view(st)
      st.background_color = color.white
    end
  
    def product_title(st)
      st.frame = {top: 25, left: 80, width: device_width - 100, height: 36}
      st.color = color.battleship_gray
      st.font = font.small
      st.view.lineBreakMode = 0
      st.view.numberOfLines = 0
    end  
  
    def product_thumb(st)   
      st.frame = { top: 10, left: 10 , width: 60, height: 60}
      st.background_color = color.black
      # http://www.rubydoc.info/github/infinitered/rmq/RubyMotionQuery/Stylers/UIViewStyler
    end
    
  end

end