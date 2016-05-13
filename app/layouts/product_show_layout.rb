class ProductShowLayout < MK::Layout
  def layout

    add UIScrollView, :scroll_view do
      background_color rmq.color.background_gray
      target.scrollEnabled = true

      add UIView, :content_view do
        add UIView, :title do
          background_color rmq.color.white

          add UILabel, :product_title do 
            color rmq.color.black
            font rmq.font.small
            target.numberOfLines = 0
            size_to_fit
          end

          add UIImageView, :product_image do 
            size_to_fit
          end
        end      
      end
    end

  end

  def add_constraints
    constraints(:scroll_view) do
      top_left x:0, y: 0
      leading 0
      trailing 0
      width.equals(:superview)
      height.equals(:superview)
    end

    constraints(:content_view) do
      top 0
      bottom 0
      leading 0
      trailing 0
      width.equals(:superview)
    end

    constraints(:title) do
      top_left x: 0, y: 30
      width.equals(view)
    end

    constraints(:product_title) do
      top_left x: 20, y: 10
      width.equals(view).minus(40)
    end

    constraints(:product_image) do
      left 30
      top 100
      height 300
      width 300
    end

  end  

end