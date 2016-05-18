module Products
  class IndexScreen < PM::TableScreen
    
    include Navigation
  
    title "最新上架"
    stylesheet Products::IndexScreenStylesheet
    
   
    def on_load
      add_side_menu
      @products = []
      load_products
    end
  
  
    def show_menu
      app_delegate.show_menu
    end
  
  
    def sign_in_button
      open SignInScreen.new(nav_bar: true)
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
            cell_class: ProductCell,
            properties: {
              title: product.title,
              price: product.price,
              image_url: product.image_url
            },
            height: 100,
            action: :view_product,
            arguments: { product: product }
          }
        end
      }]
    end
  
    def view_product(args)
      open Products::ShowScreen.new(args)
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
  