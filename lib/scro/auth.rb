require "json"
require "rest_client"

module Scro
  module Auth
    class RequestError < StandardError; end

    def self.endpoint
      "https://github.com/api/v2/json/"
    end

    def self.get(token, path)
      response = RestClient.get("#{endpoint}#{path}?access_token=#{token}")
      raise RequestError, response.inspect unless response.code == 200
      JSON.parse(response)
    end
  end
end

require "scro/auth/user"
