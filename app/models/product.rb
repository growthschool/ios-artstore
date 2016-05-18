class Product
  attr_accessor :id, :title, :image_url

  def initialize(data)
    @id = data["id"]
    @title = data["title"]
    @image_url = data["image_url"]
  end

  def self.all(&callback)
    ApiClient.client.get "products/list" do |response|
      models = []
      if response.success?
        models = response.object["list"].map {|data| new(data) }
      end
      callback.call(response, models)
    end
  end

  def self.add_to_cart(product_id,&callback)
    ApiClient.client.post("/products/add_to_cart", :product_id => product_id ) do |response|
      model = response.object["product"]
      if response.success?
        model = new(model)
        #models = response.object["list"].map {|data| new(data) }
      end
      callback.call(response, model)
    end
  end

end