class Product
  attr_accessor :id, :title

  def initialize(data)
    @id = data["id"]
    @title = data["title"]
  end

  def self.all(&callback)
    ApiClient.client.get "products/list" do |response|
      models = []
      if response.success?
        models = response.object.map {|data| new(data) }
      end
      callback.call(response, models)
    end
  end

end