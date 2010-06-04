require "json"
require "rest_client"

module Scro
  module Auth
    class RequestError < StandardError; end

    def self.endpoint
      "https://github.com/api/v2/json/"
    end

    def self.get(token, path, query_params = { })
      params = {'token' => token}.merge(query_params)
      response = RestClient.get("#{endpoint}#{path}", {:accept => :json, :params => params})
      raise RequestError, response.inspect unless response.code == 200
      JSON.parse(response)
    end
  end
end

require "scro/auth/user"
