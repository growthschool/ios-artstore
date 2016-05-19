class AddCreditCardScreen < PM::Screen
  title "新增信用卡"
  stylesheet AddCreditCardScreenStylesheet

  def on_load

    @paymentView = STPPaymentCardTextField.alloc.initWithFrame(CGRectMake(15, 85, 290, 40 ))
    @paymentView.delegate = self
    self.view.addSubview @paymentView


     set_nav_bar_button :left, title: "Cancel" , action: :cancel_back_home
     set_nav_bar_button :right, title: "Save", action: :save_card_action



    # Refactor to PM::Screen style
  end

  def cancel_back_home
    app.delegate.open_authenticated_root
  end


  def save_card_action
    if @paymentView.card
      mp @paymentView.card.number
    end
  
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
