class ViewProductScreenStylesheet < ApplicationStylesheet
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
    st.frame = :full
    st.content_mode = :scale_aspect_fit
  end

  def root_view(st)
    st.background_color = color.white
  end
end