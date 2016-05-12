class ApiClient
  class << self
    def client
      @client ||= AFMotion::SessionClient.build("http://api-artstore.dev/") do
        response_serializer :json
      end
    end

  end
end