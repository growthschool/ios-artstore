schema "0001 initial" do

  # Examples:
  #
  # entity "Person" do
  #   string :name, optional: false
  #
  #   has_many :posts
  # end
  #
  entity "CartItem" do
    integer32 :product_id
    integer32 :product_price
    string :product_name
  
    datetime :created_at
    datetime :updated_at
    
#    belongs_to :product
  end

end
