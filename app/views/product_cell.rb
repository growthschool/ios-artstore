class ProductCell < PM::TableViewCell

  def title=(title)
    @title_view ||= rmq.append(UILabel, :product_title)
    @title_view.data = title


    @right_chevron ||= rmq.append(UILabel, :right_chevron)
  end

  def image_url=(url)
    @image_view = rmq.append(UIImageView, :product_thumb).style {|st| st.remote_image = url }
  end


end