class CartScreen < PM::DataTableScreen
  title "Shopping Cart"
  stylesheet CartScreenStylesheet

  model CartItem, scope: :sort_created_at

  def on_load
    set_nav_bar_button :right, :title => "清空", :action => :clear_cart
  end
  

  def clear_cart
    CartItem.all.each do |ci|
      ci.destroy
    end

    cdq.save
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
