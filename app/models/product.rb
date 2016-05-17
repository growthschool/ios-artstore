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

  def self.add_do_cart(&callback)
    ApiClient.client.post "carts" do |response|
      models = []
      if response.success?
        models = response.object["list"].map {|data| new(data) }
      end
      callback.call(response, models)
    end
  end

end