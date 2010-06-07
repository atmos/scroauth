require "json"
require "rest_client"

module Scro
  module Auth
    class RequestError < StandardError; end

    class Request
      def initialize(token)
        raise RequestError, "Token not configured" if token.nil? || token.empty?
        @token = token
      end

      def get(path)
        response = RestClient.get(uri_for(path))
        raise RequestError, response.inspect unless response.code == 200
        JSON.parse(response)
      end

      def post(path, params)
        response = RestClient.post(uri_for(path), {:content_type => :json, :params => params, :body => params})
        raise RequestError, response.inspect unless response.code == 200
        JSON.parse(response)
      end

      def uri_for(path)
        "#{endpoint}#{path}?access_token=#{@token}"
      end

      def endpoint
        "https://github.com/api/v2/json/"
      end
    end
  end
end

require "scro/auth/user"
require "scro/auth/repository"
