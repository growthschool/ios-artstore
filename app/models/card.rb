class Card
  
  attr_accessor :token

  def initialize(data)
    @token = data["token"]
  end

  def self.create(number,&callback)
    ApiClient.client.post("/cards", 
      :token => MotionKeychain.get(:auth_token), :number => number.to_s ,
    ) do |response|
      model = nil
      if response.success?
        model = new(response.object)
      end
      callback.call(response, model)
    end
  end

end