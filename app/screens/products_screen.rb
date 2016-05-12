class ProductsScreen < PM::TableScreen
  title "Your title here"
  stylesheet ProductsScreenStylesheet

  def on_load
    @products = []
    load_products
  end



  def load_products
    Product.all do |response, products|
      if response.success?
        @products = products
        stop_refreshing
        update_table_data
      else
        app.alert "Sorry, there was an error fetching the products."
        mp response.error.localizedDescription
      end
    end
  end

  def table_data
    [{
      cells: @products.map do |product|
        {
          height: 100,
          title: product.title,
          action: :view_product,
          arguments: { product: product }
        }
      end
    }]
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
