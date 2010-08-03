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
        response = RestClient.get(uri_for(path), {:accept => :json})
        raise RequestError, response.inspect unless response.code == 200
        JSON.parse(response)
      end

      def post(path, params)
        params.merge!(:access_token => @token)
        response = RestClient.post(uri_for(path), {:params => params, :body => params}, {:content_type => :json, :accept => :json})
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

require "scro/auth/key"
require "scro/auth/user"
require "scro/auth/repository"
