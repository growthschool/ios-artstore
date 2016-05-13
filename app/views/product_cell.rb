class ProductCell < PM::TableViewCell

  def title=(title)
    @title_view ||= rmq.append(UILabel, :product_title)
    @title_view.data = title


    @right_chevron ||= rmq.append(UILabel, :right_chevron)
  end

end