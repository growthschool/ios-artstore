class ProductsScreenStylesheet < ApplicationStylesheet
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
    st.frame = {top: 20, left: 20, width: device_width - 100, height: 36}
    st.color = color.battleship_gray
    st.font = font.small
    st.view.lineBreakMode = 0
    st.view.numberOfLines = 0
  end  
  
end
