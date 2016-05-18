class CartScreen < PM::DataTableScreen
  title "Shopping Cart"
  stylesheet CartScreenStylesheet

  model CartItem, scope: :sort_created_at

  def on_load

    @cart_total_price = calculate_cart_sum

    set_nav_bar_button :right, :title => "清空", :action => :clear_cart
    set_toolbar_items [{
         title: "Total : $#{ @cart_total_price.to_s}" ,
       }, {
         system_item: :flexible_space
       }, {
         title: "Checkout" ,
         action: :checkout_action
     }]

  end


  def calculate_cart_sum
    sum = 0

    CartItem.all.each do |ci|
      sum = sum + ci.product_price.to_i
    end

    return sum
  end
  
  def checkout_action
  end

  def clear_cart
    CartItem.all.each do |ci|
      ci.destroy
    end
    cdq.save
    # TODO : 要更新總金額
  end

  def on_cell_deleted(cell, index_path)
    mp index_path
    CartItem.all[index_path.row].destroy
    # TODO: desc 要另外處理，否則會刪錯
    cdq.save
    false
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
