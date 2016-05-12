class ProductTemplate
  attr_accessor :id, :title

  def initialize(data)
    @id = data["id"]
    @name = data["name"]
  end

  def self.all(&callback)
    ApiClient.client.get "products/list" do |response|
      models = nil
      if response.success?
        models = response.object.map do |data|
          new(data)
        end
      end
      callback.call(response, models)
    end
  end
end