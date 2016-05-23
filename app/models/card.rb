class Card
  
  attr_accessor :token

  def initialize(data)
    @token = data["token"]
  end

  def self.create(number, cvc, exp_month, exp_year, &callback)
    ApiClient.client.post("/cards", 
      :token => MotionKeychain.get(:auth_token), :number => number.to_s ,
      :cvc => cvc , :exp_month => exp_month, :exp_year => exp_year
    ) do |response|
      model = nil
      if response.success?
        model = new(response.object)
      end
      callback.call(response, model)
    end
  end

end